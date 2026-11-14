extends Control

enum Screen { TITLE, PASSAGE, PEEK }
enum Overlay { NONE, PAUSE, SETTINGS }

const PASSAGE := preload("res://assets/opening/passage.jpg")
const PEEK := preload("res://assets/opening/peek.jpg")

@onready var backdrop: TextureRect = %Backdrop
@onready var opening_title: Control = %OpeningTitle
@onready var story: Control = %Story
@onready var caption: Label = %Caption
@onready var location: Label = %Location
@onready var action: Button = %Action
@onready var options: Control = %Options
@onready var options_title: Label = %OptionsTitle
@onready var volume: HSlider = %Volume
@onready var reduced_motion: CheckButton = %ReducedMotion
@onready var room_tone: AudioStreamPlayer = %RoomTone
@onready var settle: AudioStreamPlayer = %Settle

var screen := Screen.TITLE
var panel := Overlay.NONE
var fade: Tween


func _ready() -> void:
	%Begin.pressed.connect(_show_screen.bind(Screen.PASSAGE))
	%Quit.pressed.connect(get_tree().quit)
	%TitleSettings.pressed.connect(_show_panel.bind(Overlay.SETTINGS))
	%Pause.pressed.connect(_show_panel.bind(Overlay.PAUSE))
	%Resume.pressed.connect(_close_panel)
	%ReturnToTitle.pressed.connect(_return_to_title)
	%Gap.pressed.connect(_peek)
	action.pressed.connect(_story_action)
	volume.value_changed.connect(_set_volume)
	reduced_motion.toggled.connect(_set_reduced_motion)
	_show_screen(Screen.TITLE)
	_set_volume(volume.value)


func _unhandled_key_input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_cancel"):
		return
	get_viewport().set_input_as_handled()
	if panel != Overlay.NONE:
		_close_panel()
	elif screen != Screen.TITLE:
		_show_panel(Overlay.PAUSE)


func _story_action() -> void:
	if screen == Screen.PASSAGE:
		_peek()
	elif screen == Screen.PEEK:
		_show_screen(Screen.PASSAGE)


func _peek() -> void:
	if screen == Screen.PASSAGE and panel == Overlay.NONE:
		_show_screen(Screen.PEEK)
		settle.play()


func _show_screen(next: Screen) -> void:
	screen = next
	var on_title := screen == Screen.TITLE
	var peeking := screen == Screen.PEEK
	backdrop.texture = PEEK if peeking else PASSAGE
	opening_title.visible = on_title
	story.visible = not on_title
	%TitleShade.visible = on_title
	%Gap.visible = screen == Screen.PASSAGE
	location.text = "AT THE THRESHOLD" if peeking else "AH MA’S HOUSE"
	caption.text = (
		"[Ah Ma chants under her breath]\nHer slippers. A second shadow."
		if peeking
		else "I used to wake up to that red light."
	)
	action.text = "Look away" if peeking else "Look under the door"
	room_tone.volume_db = -26.0 if peeking else -20.0
	if on_title:
		room_tone.stop()
		settle.stop()
	elif not room_tone.playing:
		room_tone.play()

	if fade:
		fade.kill()
	backdrop.modulate.a = 1.0
	if peeking and not reduced_motion.button_pressed:
		backdrop.modulate.a = 0.2
		fade = create_tween()
		fade.tween_property(backdrop, "modulate:a", 1.0, 0.24)
	_default_focus().grab_focus()


func _show_panel(next: Overlay) -> void:
	panel = next
	options_title.text = "Settings" if panel == Overlay.SETTINGS else "Paused"
	%Resume.text = "Back" if panel == Overlay.SETTINGS else "Resume"
	%ReturnToTitle.visible = panel == Overlay.PAUSE
	opening_title.hide()
	story.hide()
	if room_tone.playing:
		room_tone.stream_paused = true
	if settle.playing:
		settle.stream_paused = true
	if fade and fade.is_running():
		fade.pause()
	options.show()
	%Resume.grab_focus()


func _close_panel() -> void:
	panel = Overlay.NONE
	options.hide()
	opening_title.visible = screen == Screen.TITLE
	story.visible = screen != Screen.TITLE
	room_tone.stream_paused = false
	settle.stream_paused = false
	if fade and fade.is_valid():
		fade.play()
	_default_focus().grab_focus()


func _return_to_title() -> void:
	_close_panel()
	_show_screen(Screen.TITLE)


func _default_focus() -> Button:
	return %Begin if screen == Screen.TITLE else action


func _set_volume(value: float) -> void:
	var master := AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_linear(master, value / 100.0)


func _set_reduced_motion(enabled: bool) -> void:
	if enabled and fade:
		fade.kill()
		backdrop.modulate.a = 1.0
