extends GridContainer

const SETTINGS_FILE := "user://audio.cfg"
const BUSES := [&"Master", &"Music", &"SFX"]

var preferences := ConfigFile.new()
var changes_pending := false


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
	visibility_changed.connect(_save_if_closed)


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
