extends Button

@export var selection_underline := false

var keyboard_navigation := false
var underline_amount := 0.0
var underline_tween: Tween


func _ready() -> void:
	add_to_group(&"text_actions")
	mouse_entered.connect(_update_underline)
	mouse_exited.connect(_update_underline)
	focus_entered.connect(_update_underline)
	focus_exited.connect(_update_underline)
	visibility_changed.connect(_update_underline)
	toggled.connect(func(_selected: bool): queue_redraw())


func set_keyboard_navigation(enabled: bool) -> void:
	keyboard_navigation = enabled
	_update_underline()


func _update_underline() -> void:
	if underline_tween:
		underline_tween.kill()
	if disabled or not is_visible_in_tree():
		_set_underline_amount(0.0)
		return
	var target := 1.0 if is_hovered() or (keyboard_navigation and has_focus()) else 0.0
	underline_tween = create_tween()
	underline_tween.tween_method(_set_underline_amount, underline_amount, target, 0.14)


func _set_underline_amount(amount: float) -> void:
	underline_amount = amount
	queue_redraw()


func _draw() -> void:
	var selected := selection_underline and button_pressed
	if not selected and underline_amount <= 0.0:
		return
	var font := get_theme_font("font")
	var font_size := get_theme_font_size("font_size")
	var width := font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size).x
	var left := 0.0
	if alignment == HORIZONTAL_ALIGNMENT_CENTER:
		left = (size.x - width) * 0.5
	elif alignment == HORIZONTAL_ALIGNMENT_RIGHT:
		left = size.x - width
	var y := floorf((size.y + font.get_height(font_size)) * 0.5)
	var ink := Color("ead6b9") if selected else Color("ccbba3")
	ink.a = 1.0 if selected else underline_amount
	draw_rect(Rect2(left, y, width, 1.0 + underline_amount), ink)
