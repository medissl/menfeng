extends ColorRect

signal hold_changed(item: StringName)
signal closed

const StoryText := preload("res://scenes/opening_story.gd")
const OFFERING_ICONS := {
	&"cups": preload("res://assets/ritual/offering-cup.png"),
	&"tea": preload("res://assets/ritual/offering-tea.png"),
	&"wine": preload("res://assets/ritual/offering-wine.png"),
	&"paper": preload("res://assets/ritual/offering-joss-paper.png"),
}
const ITEM_DETAILS := {
	&"vessel": {
		"name": "Clay vessel",
		"description": "A child-shaped jar from under Ah Ma’s wardrobe shelf. It takes both hands to lift.",
		"image": preload("res://assets/finale/vessel.png"),
	},
	&"chalk": {
		"name": "Ah Ma’s tin",
		"held_name": "Ah Ma’s tin",
		"description": "A small tin with a stub of chalk and a little white powder.",
		"image": preload("res://assets/finale/chalk-tin.png"),
	},
	&"incense": {
		"name": "Three incense sticks",
		"description": "From the dresser in Ah Ma’s room.",
		"image": preload("res://assets/ritual/inventory-incense.png"),
	},
	&"portrait": {
		"name": "Grandpa’s portrait",
		"held_name": "Grandpa’s portrait",
		"description": "The small frame from the sitting-room cabinet.",
		"image": preload("res://assets/ritual/grandpa-portrait.png"),
	},
}

@onready var slots: VBoxContainer = $Contents/Slots
@onready var item_name: Label = $Contents/ItemName
@onready var item_description: Label = $Contents/ItemDescription
@onready var item_image: TextureRect = $Contents/ItemImage
@onready var hold: Button = $Contents/Hold
@onready var back: Button = $Contents/Close
@onready var selection_dash: ColorRect = $Contents/SelectionDash

var items: Array[StringName] = []
var held: StringName = &""
var selected := -1


func _ready() -> void:
	for i in slots.get_child_count():
		slots.get_child(i).pressed.connect(_select.bind(i))
	hold.pressed.connect(_toggle_hold)
	back.pressed.connect(func(): closed.emit())


func present(collected: Array[StringName], active: StringName) -> void:
	items = collected
	held = active
	selected = maxi(items.find(held), 0) if not items.is_empty() else -1
	_refresh()
	var target: Button = slots.get_child(selected) if selected >= 0 else back
	target.grab_focus()


func _select(index: int) -> void:
	selected = index
	_refresh()


func _toggle_hold() -> void:
	if selected < 0 or selected >= items.size():
		return
	var item := items[selected]
	held = &"" if held == item else item
	hold_changed.emit(held)


func _refresh() -> void:
	for i in slots.get_child_count():
		var slot: Button = slots.get_child(i)
		slot.visible = i < items.size()
		if slot.visible:
			var item := items[i]
			var suffix := "   Held" if item == held else ""
			slot.text = String(item_detail(item)["name"]) + suffix
	hold.visible = selected >= 0
	item_image.visible = selected >= 0
	selection_dash.visible = selected >= 0
	if selected < 0:
		item_name.text = "Nothing collected"
		item_description.text = "Items you pick up will appear here."
		return
	var item := items[selected]
	var detail := item_detail(item)
	var selected_row: Button = slots.get_child(selected)
	var stride := selected_row.get_combined_minimum_size().y + slots.get_theme_constant("separation")
	selection_dash.position.y = slots.position.y + selected * stride + selected_row.get_combined_minimum_size().y * 0.5
	item_name.text = detail["name"]
	item_description.text = detail["description"]
	item_image.texture = detail["image"]
	hold.text = "Put away" if held == item else "Hold item ›"


func item_detail(item: StringName) -> Dictionary:
	if OFFERING_ICONS.has(item):
		var copy: Array = StoryText.OFFERING_ITEMS[item]
		return {"name": copy[0], "description": copy[1], "image": OFFERING_ICONS[item]}
	return ITEM_DETAILS[item]


func held_description(item: StringName) -> String:
	var detail := item_detail(item)
	return "Holding " + String(detail.get("held_name", String(detail["name"]).to_lower()))
