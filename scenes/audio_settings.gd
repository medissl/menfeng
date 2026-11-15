extends GridContainer

const SETTINGS_FILE := "user://audio.cfg"
const BUSES := [&"Master", &"Music", &"SFX"]
const TEXT_SPEED_NAMES := ["Slow", "Normal", "Fast", "Instant"]
const TEXT_SPEED_RATES := [48.0, 90.0, 145.0, 0.0]

var preferences := ConfigFile.new()
var changes_pending := false
var fullscreen := false
var vsync := true
var text_speed := 1


func _ready() -> void:
	preferences.load(SETTINGS_FILE)
	for bus: StringName in BUSES:
		var slider: HSlider = get_node(NodePath(bus))
		var readout: Label = get_node("%sReadout" % bus)
		var value: Variant = preferences.get_value("Volume", bus, slider.value)
		if value is float or value is int:
			slider.set_value_no_signal(clampf(float(value), 0.0, 100.0))
		_apply_volume(slider.value, AudioServer.get_bus_index(bus), readout)
		slider.value_changed.connect(_change_volume.bind(bus, AudioServer.get_bus_index(bus), readout))
	fullscreen = get_window().mode in [Window.MODE_FULLSCREEN, Window.MODE_EXCLUSIVE_FULLSCREEN]
	var saved_mode: Variant = preferences.get_value("Display", "Fullscreen", fullscreen)
	if saved_mode is bool and saved_mode != fullscreen:
		fullscreen = saved_mode
		_apply_display_mode()
	vsync = preferences.get_value("Display", "VSync", true) != false
	_apply_vsync()
	var saved_speed: Variant = preferences.get_value("Reading", "TextSpeed", text_speed)
	if saved_speed is int and saved_speed >= 0 and saved_speed < TEXT_SPEED_NAMES.size():
		text_speed = saved_speed
	_update_choices()
	$DisplayMode.pressed.connect(_toggle_display_mode)
	$VSync.pressed.connect(_toggle_vsync)
	$TextSpeed.pressed.connect(_cycle_text_speed)
	visibility_changed.connect(_save_if_closed)


func reveal_duration(characters: int) -> float:
	var rate: float = TEXT_SPEED_RATES[text_speed]
	if is_zero_approx(rate):
		return 0.0
	return minf(characters / rate, 1.65 if text_speed == 0 else 1.0)


func _toggle_display_mode() -> void:
	fullscreen = not fullscreen
	_apply_display_mode()
	_store_choice("Display", "Fullscreen", fullscreen)


func _apply_display_mode() -> void:
	var window := get_window()
	window.mode = Window.MODE_FULLSCREEN if fullscreen else Window.MODE_WINDOWED
	if not fullscreen:
		window.borderless = false


func _toggle_vsync() -> void:
	vsync = not vsync
	_apply_vsync()
	_store_choice("Display", "VSync", vsync)


func _apply_vsync() -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if vsync else DisplayServer.VSYNC_DISABLED)


func _cycle_text_speed() -> void:
	text_speed = (text_speed + 1) % TEXT_SPEED_NAMES.size()
	_store_choice("Reading", "TextSpeed", text_speed)


func _store_choice(section: String, key: String, value: Variant) -> void:
	preferences.set_value(section, key, value)
	changes_pending = true
	_update_choices()
	_save()


func _update_choices() -> void:
	_set_choice($DisplayMode, "Display mode", "Fullscreen" if fullscreen else "Windowed")
	_set_choice($VSync, "V-Sync", "On" if vsync else "Off")
	_set_choice($TextSpeed, "Text speed", TEXT_SPEED_NAMES[text_speed])


func _set_choice(button: Button, label: String, value: String) -> void:
	button.text = value + "  ›"
	button.accessibility_name = "%s, %s" % [label, value]


func _change_volume(value: float, bus: StringName, index: int, readout: Label) -> void:
	_apply_volume(value, index, readout)
	preferences.set_value("Volume", bus, value)
	changes_pending = true


func _apply_volume(value: float, index: int, readout: Label) -> void:
	AudioServer.set_bus_volume_linear(index, value / 100.0)
	readout.text = "%d%%" % roundi(value)


func _save_if_closed() -> void:
	if not is_visible_in_tree():
		_save()


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		_save()


func _save() -> void:
	if changes_pending and preferences.save(SETTINGS_FILE) == OK:
		changes_pending = false
