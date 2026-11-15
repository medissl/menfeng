extends Control

enum Screen {
	TITLE, INTRO, DRIVE, YARD, HALL, MEMORY, PEEK, MORNING,
	SITTING, GUEST_BEDROOM, BEDROOM, KITCHEN, BATHROOM, BURN_AREA, TAPE, SOFA_MEMORY,
	WARDROBE, VESSEL_OPEN, RITUAL_MEMORY, MARKED, BURNING, LISTEN, REVEAL, BEDROOM_ECHO, OUTRO_BLACK, CREDITS, END_CARD,
}
enum Overlay { NONE, PAUSE, SETTINGS, INVENTORY, INSTRUCTION }
enum Stage {
	ARRIVAL, RESPECTS, NOTE, WATCH_TAPE, TAKE_INCENSE, PLACE_INCENSE, LIGHT_INCENSE,
	RETURN_TO_TAPE, TAKE_PORTRAIT, PLACE_PORTRAIT, OFFERINGS_TAPE, PREPARE_OFFERINGS, INVITATION_TAPE,
	TAKE_VESSEL, PREPARATION_TAPE, RETURN_TO_WELL, TAKE_CHALK, MARK_FOREHEAD, PLACE_PAPER,
	BURN_OFFERING, FINAL_TAPE, FINISHED,
}
enum RitualAction {
	NONE, TAKE, PLACE, LIGHT, TURN_PORTRAIT, TAKE_PORTRAIT, PLACE_PORTRAIT,
	TAKE_OFFERING, USE_OFFERING, LIFT_BOARD, TAKE_VESSEL, SET_VESSEL, OPEN_VESSEL,
	TAKE_CHALK, MARK_FOREHEAD, PLACE_PAPER, BURN_OFFERING, TURN_RECEIPT, TURN_LEFT,
}
enum DrivePart { ROAD, RINGING, CALL, AFTER_CALL }

const PASSAGE := preload("res://assets/opening/passage.jpg")
const CHILDHOOD_BEDROOM := preload("res://assets/house/guest-bedroom.jpg")
const BEDROOM_AT_NIGHT := preload("res://assets/opening/bedroom-memory.jpg")
const BEDROOM_WITHOUT_INCENSE := preload("res://assets/ritual/bedroom-no-incense.jpg")
const TAPE_FRAME := preload("res://assets/ritual/ah-ma-tape.jpg")
const TAPE_GLANCE := preload("res://assets/ritual/ah-ma-tape-glance.jpg")
const TAPE_INSERT := preload("res://assets/audio/tape-insert.wav")
const TAPE_PLAY := preload("res://assets/audio/tape-play.wav")
const TAPE_EJECT := preload("res://assets/audio/tape-eject.wav")
const PORTRAIT_FRONT := preload("res://assets/ritual/grandpa-portrait.png")
const PORTRAIT_BACK := preload("res://assets/ritual/grandpa-frame-back.png")
const POUR := preload("res://assets/audio/short-pour.wav")
const GIGGLE := preload("res://assets/audio/distant-giggle.wav")
const WOOD_RUN := preload("res://assets/audio/wood-run.wav")
const FAR_DOOR_SLAM := preload("res://assets/audio/far-door-slam.wav")
const WELL_SWELL := preload("res://assets/audio/well-swell.wav")
const BURNER_SUSPENSE := preload("res://assets/audio/burner-suspense.wav")
const BOARD_LIFT := preload("res://assets/audio/wardrobe-board.wav")
const VESSEL_SET := preload("res://assets/audio/vessel-set.wav")
const VESSEL_LID := preload("res://assets/audio/vessel-lid.wav")
const WELL_ROPE := preload("res://assets/audio/well-rope.wav")
const RITE_CHANT := preload("res://assets/audio/rite-chant.wav")
const OFFERING_FIRE := preload("res://assets/audio/offering-fire.wav")
const GRANDPA_LAUGH := preload("res://assets/audio/doorway-laugh.wav")
const WRIST_CHAIN := preload("res://assets/audio/wrist-chain.wav")
const VESSEL := preload("res://assets/finale/vessel.png")
const HOSPITAL_SLIPS := preload("res://assets/finale/hospital-slips.png")
const RECEIPT_BACK := preload("res://assets/finale/receipt-back.png")
const CHALK_TIN := preload("res://assets/finale/chalk-tin.png")
const WARDROBE_SHELF := preload("res://assets/finale/wardrobe-shelf.jpg")
const WARDROBE_CAVITY := preload("res://assets/finale/wardrobe-cavity.jpg")
const VESSEL_INTERIOR := preload("res://assets/finale/vessel-interior.jpg")
const MARKED_FINGERS := preload("res://assets/finale/marked-fingers.jpg")
const LIT_BURNER := preload("res://assets/finale/lit-burner.jpg")
const TAPE_CRYING := preload("res://assets/ritual/ah-ma-tape-crying.jpg")
const REVEAL_STARE := preload("res://assets/finale/doorway-stare.jpg")
const TV_SEATED := preload("res://assets/ritual/crt-seated.jpg")
const REVEAL_FADE := 0.65
const REVEAL_SILENCE := 1.5
const FINAL_LINE_HOLD := 2.6
const OUTRO_BLACK_HOLD := 1.2
const WATCHER := preload("res://assets/finale/passage-watcher.png")
const CUP_NAMES := ["Left cup", "Middle cup", "Right cup"]

const OBJECTIVES := {
	Stage.RESPECTS: "Speak to Ah Ma at the ancestor altar beside Pek Kong.",
	Stage.NOTE: "Read Dad’s note beside the couch in the sitting room.",
	Stage.WATCH_TAPE: "Play Ah Ma’s tape in the sitting room.",
	Stage.TAKE_INCENSE: "Find the incense on the dresser in Ah Ma’s bedroom.",
	Stage.PLACE_INCENSE: "Hold the incense, then use it at the ancestor altar.",
	Stage.LIGHT_INCENSE: "Light the incense at the ancestor altar.",
	Stage.RETURN_TO_TAPE: "Return to the TV for Ah Ma’s next instruction.",
	Stage.TAKE_PORTRAIT: "Look for Grandpa’s portrait in the sitting-room cabinet.",
	Stage.PLACE_PORTRAIT: "Hold Grandpa’s portrait and take it to the ancestor altar.",
	Stage.OFFERINGS_TAPE: "Return to the TV for Chapter 3.",
	Stage.INVITATION_TAPE: "Return to the TV for Chapter 4.",
	Stage.PREPARATION_TAPE: "Return to the TV for Ah Ma’s last instructions.",
	Stage.RETURN_TO_WELL: "Go back to the well in the bathroom.",
	Stage.TAKE_CHALK: "Find the small tin on Ah Ma’s dresser.",
	Stage.MARK_FOREHEAD: "Hold Ah Ma’s tin and use it at the ancestor altar.",
	Stage.PLACE_PAPER: "Set the joss paper beside the vessel at the covered burner.",
	Stage.BURN_OFFERING: "Light the offering in the covered burner.",
	Stage.FINAL_TAPE: "Return to the TV for Ah Ma’s last recording.",
}

const StoryText := preload("res://scenes/opening_story.gd")
const TAPE_CHAPTERS := StoryText.TAPES
const CONFESSION_FLASHBACKS := {
	StoryText.CONFESSION_NIGHT_BEAT: Screen.MEMORY,
	StoryText.CONFESSION_DAY_BEAT: Screen.RITUAL_MEMORY,
	StoryText.CONFESSION_SOFA_BEAT: Screen.SOFA_MEMORY,
}
const VIEWS := {
	Screen.TITLE: [PASSAGE, ""],
	Screen.INTRO: [PASSAGE, ""],
	Screen.DRIVE: [
		preload("res://assets/opening/forest.jpg"),
		"",
	],
	Screen.YARD: [
		preload("res://assets/opening/yard.jpg"),
		"",
	],
	Screen.HALL: [
		preload("res://assets/opening/hall-ancestor-table.jpg"),
		"",
	],
	Screen.MEMORY: [BEDROOM_AT_NIGHT, ""],
	Screen.PEEK: [
		preload("res://assets/opening/peek.jpg"),
		"",
	],
	Screen.MORNING: [preload("res://assets/ritual/ah-ma-breakfast.jpg"), ""],
	Screen.SITTING: [preload("res://assets/house/sitting-room.jpg"), ""],
	Screen.SOFA_MEMORY: [preload("res://assets/ritual/ah-ma-sofa-memory.jpg"), ""],
	Screen.GUEST_BEDROOM: [CHILDHOOD_BEDROOM, ""],
	Screen.BEDROOM: [preload("res://assets/house/bedroom.jpg"), ""],
	Screen.KITCHEN: [preload("res://assets/house/kitchen-clean.jpg"), ""],
	Screen.BATHROOM: [preload("res://assets/house/bathroom.jpg"), ""],
	Screen.BURN_AREA: [preload("res://assets/house/covered-burn-area.jpg"), ""],
	Screen.TAPE: [TV_SEATED, ""],
	Screen.WARDROBE: [WARDROBE_SHELF, ""],
	Screen.VESSEL_OPEN: [VESSEL_INTERIOR, ""],
	Screen.MARKED: [MARKED_FINGERS, ""],
	Screen.BURNING: [LIT_BURNER, ""],
	Screen.RITUAL_MEMORY: [preload("res://assets/finale/ritual-day-memory.jpg"), ""],
	Screen.LISTEN: [TV_SEATED, ""],
	Screen.CREDITS: [null, ""],
	Screen.REVEAL: [preload("res://assets/finale/sitting-reveal.jpg"), ""],
	Screen.BEDROOM_ECHO: [preload("res://assets/finale/bedroom-echo.jpg"), ""],
	Screen.OUTRO_BLACK: [null, ""],
	Screen.END_CARD: [null, ""],
}

const RETURN_TO := {
	Screen.HALL: Screen.YARD,
	Screen.SITTING: Screen.HALL,
	Screen.GUEST_BEDROOM: Screen.HALL,
	Screen.BEDROOM: Screen.HALL,
	Screen.KITCHEN: Screen.HALL,
	Screen.BATHROOM: Screen.KITCHEN,
	Screen.BURN_AREA: Screen.KITCHEN,
	Screen.WARDROBE: Screen.BEDROOM,
}

const DOORS := {
	Screen.HALL: [Screen.YARD, Screen.GUEST_BEDROOM, Screen.BEDROOM, Screen.KITCHEN],
	Screen.KITCHEN: [Screen.BATHROOM],
}

const NARRATION := {
	Screen.DRIVE: StoryText.DRIVE,
	Screen.YARD: StoryText.YARD,
	Screen.HALL: StoryText.HALL,
	Screen.MEMORY: StoryText.NIGHT_MEMORY,
	Screen.PEEK: StoryText.PEEK,
	Screen.MORNING: StoryText.BREAKFAST,
	Screen.SOFA_MEMORY: StoryText.SOFA_MEMORY,
	Screen.RITUAL_MEMORY: StoryText.RITUAL_MEMORY,
	Screen.BEDROOM_ECHO: StoryText.BEDROOM_ECHO,
	Screen.VESSEL_OPEN: StoryText.VESSEL_INSIDE,
	Screen.MARKED: StoryText.FOREHEAD_MARK,
	Screen.BURNING: StoryText.FIRE_BEATS,
}

const INSPECTIONS := {
	Screen.YARD: [
		["Ti Kong incense burner", [Rect2(550, 153, 89, 96)], ["Ti Kong’s burner is still hanging above the entrance."]],
		["Side door decorations", [Rect2(441, 238, 126, 214), Rect2(758, 224, 118, 228)], ["The New Year paper beside the door gods has faded.", "I always forgot to greet them."]],
		["Lucky’s bowl and chain", [Rect2(226, 543, 179, 75)], ["Lucky’s bowl. He was already old when I was little.", "He must have been gone for a long time."]],
		["Rain barrel", [Rect2(61, 413, 92, 123)], ["The barrel had filled right to the lip. Ah Ma used to soften the dirt around her pots with the first dipperful."]],
		["Front door", [Rect2(575, 233, 181, 269)], [], Screen.HALL],
	],
	Screen.HALL: [
		["Family portraits", [Rect2(242, 224, 226, 116)], ["There’s Ah Ma, next to the old family photo."]],
		["Ancestor altar", [Rect2(195, 340, 378, 73)], ["The ash in the incense burner is cold."]],
		["Pek Kong shrine", [Rect2(588, 140, 149, 251)], ["Pek Kong looked after the house. Ah Ma used to lift me up so I could see his face."]],
		["Tea tray", [Rect2(471, 580, 262, 60)], ["The little pot was cold. Ah Ma used to set it between her palms first to see if it was still warm enough to pour."]],
		["Kitchen door", [Rect2(86, 151, 106, 356)], [], Screen.KITCHEN],
		["My old bedroom", [Rect2(767, 173, 151, 322)], [], Screen.GUEST_BEDROOM],
		["Ah Ma’s bedroom", [Rect2(933, 173, 145, 322)], [], Screen.BEDROOM],
		["Sitting room", [Rect2(1107, 136, 144, 372)], [], Screen.SITTING],
	],
	Screen.SITTING: [
		["Couch", [Rect2(115, 336, 338, 229)], ["There’s still a little dip in the cushion where she sat."]],
		["Photo album and note", [Rect2(94, 550, 228, 96)], ["The photograph has faded around the edges."]],
		["Sitting-room cabinet", [Rect2(459, 288, 237, 209)], ["Ah Ma kept the everyday bowls here. The good ones were wrapped in newspaper."]],
		["Standing fan", [Rect2(716, 298, 90, 203)], ["The dial was still on its lowest setting. Ah Ma used to point it at the wall and say a draft in your face would give you a stiff neck."]],
		["TV and VHS deck", [Rect2(1019, 204, 198, 217)], ["The tape is still in the deck."]],
	],
	Screen.GUEST_BEDROOM: [
		["Old bed", [Rect2(147, 320, 481, 245)], ["She still tucked the blanket all the way under."]],
		["Travel bag", [Rect2(724, 230, 302, 204)], ["She kept the things I used to bring for the holidays."]],
	],
	Screen.BEDROOM: [
		["Incense and tin", [Rect2(710, 292, 201, 86)], ["She kept the spare incense wrapped, beside the old tin."]],
		["Cloth bag", [Rect2(663, 182, 77, 117)], ["She took this bag to market every morning. I used to get to carry it home if the tofu hadn’t leaked through."]],
		["Wardrobe", [Rect2(943, 142, 302, 419)], ["I remember the sound those doors made."]],
	],
	Screen.KITCHEN: [
		["Three cups", [Rect2(146, 429, 120, 60)], ["Three little cups. I remembered Ah Ma setting them out in a row."], &"cups"],
		["Tea jar", [Rect2(266, 328, 78, 126)], ["The old jar Ah Ma kept for tea."], &"tea"],
		["Rice wine", [Rect2(346, 303, 55, 143)], ["Ah Ma kept this bottle for the altar."], &"wine"],
		["Joss paper", [Rect2(311, 204, 90, 55)], ["She always kept a stack here."], &"paper"],
		["Bathroom door", [Rect2(468, 146, 126, 381)], [], Screen.BATHROOM],
		["Covered burn area", [Rect2(956, 160, 218, 380)], [], Screen.BURN_AREA],
	],
	Screen.BATHROOM: [
		["Well", [Rect2(640, 222, 343, 412)], ["Before they put in the sink, Ah Ma drew water here."]],
		["Sink", [Rect2(239, 352, 208, 233)], ["The tap is still dripping."]],
	],
	Screen.BURN_AREA: [
		["Burner", [Rect2(130, 411, 292, 230)], ["Cold ash. This is where she used to burn the paper."]],
	],
	Screen.WARDROBE: [
		["Woven box", [Rect2(310, 288, 224, 141)], ["I lifted the lid. Buttons, a spool of thread, and a needle pushed through the cloth."]],
		["Lower shelf", [Rect2(275, 446, 436, 110)], StoryText.WARDROBE_SHELF],
		["Red cloth tab", [Rect2(731, 497, 126, 79)], StoryText.WARDROBE_TAB],
		["Hospital slips", [Rect2(255, 388, 230, 125)], StoryText.HOSPITAL_SLIPS],
		["Clay vessel", [Rect2(705, 274, 198, 282)], StoryText.VESSEL_FOUND],
	],
}

const PROVERB := "前人栽樹，後人乘涼。"
const WARNING := "前人種禍，後人遭殃。"
const INTRO_FIRST_CARD_SECONDS := 8.0
const INTRO_RED_HOLD_SECONDS := 5.0
const INTRO_FADE_SECONDS := 0.75
const TEXT_CHARACTERS_PER_SECOND := 90.0

const INSPECTION_IMAGES := {
	"Ti Kong incense burner": preload("res://assets/inspection/ti-kong-burner.png"),
	"Side door decorations": preload("res://assets/inspection/door-decorations.png"),
	"Lucky’s bowl and chain": preload("res://assets/inspection/lucky-bowl.png"),
	"Photo album and note": preload("res://assets/inspection/family-album.png"),
	"Incense and tin": preload("res://assets/inspection/incense-tin.png"),

}

@onready var backdrop: TextureRect = %Backdrop
@onready var picture: ShaderMaterial = backdrop.material
@onready var inspection_prop: TextureRect = %InspectionProp
@onready var prop_picture: ShaderMaterial = inspection_prop.material
@onready var menu_signal: ColorRect = %MenuSignal
@onready var opening_title: Control = %OpeningTitle
@onready var story: Control = %Story
@onready var textbox: Control = %Textbox
@onready var caption: Label = %Caption
@onready var original_caption: Label = %OriginalCaption
@onready var speaker: Label = %Speaker
@onready var turn_page: Button = %TurnPage
@onready var hotspot_label: Label = %HotspotLabel
@onready var action: Button = %Action
@onready var options: Control = %Options
@onready var options_title: Label = %OptionsTitle
@onready var inventory = %Inventory
@onready var room_tone: AudioStreamPlayer = %RoomTone
@onready var settle: AudioStreamPlayer = %Settle
@onready var music: AudioStreamPlayer = %Music
@onready var engine: AudioStreamPlayer = %Engine
@onready var car_exit: AudioStreamPlayer = %CarExit
@onready var wood_door: AudioStreamPlayer = %WoodDoor
@onready var rain: AudioStreamPlayer = %Rain
@onready var chant: AudioStreamPlayer = %Chant
@onready var pickup: AudioStreamPlayer = %Pickup
@onready var rural_night: AudioStreamPlayer = %RuralNight
@onready var water_drip: AudioStreamPlayer = %WaterDrip
@onready var page_turn: AudioStreamPlayer = %PageTurn
@onready var concrete_steps: AudioStreamPlayer = %ConcreteSteps
@onready var cough: AudioStreamPlayer = %Cough
@onready var tape_sound: AudioStreamPlayer = %TapeSound
@onready var match_strike: AudioStreamPlayer = %MatchStrike
@onready var text_signal: ShaderMaterial = caption.material
@onready var intro_glitch: AudioStreamPlayer = %IntroGlitch
@onready var phone_ring: AudioStreamPlayer = %PhoneRing
@onready var pour_sound: AudioStreamPlayer = %PourSound
@onready var scare_sound: AudioStreamPlayer = %ScareSound
@onready var memory_percussion: AudioStreamPlayer = %MemoryPercussion
@onready var audio_players: Array[AudioStreamPlayer] = [
	room_tone, settle, music, engine, car_exit, wood_door, rain, chant, pickup,
	rural_night, water_drip, page_turn, concrete_steps, cough, tape_sound, match_strike, phone_ring, pour_sound, scare_sound, memory_percussion,
]

var screen := Screen.TITLE
var drive_part := DrivePart.ROAD
var road_motion := 0.0
var road_time := 0.0
var stage := Stage.ARRIVAL
var collected_items: Array[StringName] = []
var held_item: StringName = &""
var panel := Overlay.NONE
var overlay_opener: Control
var scene_time := 0.0
var keyboard_navigation := false
var narration_index := 0
var screen_lines: Array = []
var inspection_lines: Array = []
var inspection_index := 0
var inspecting_album := false
var ritual_action := RitualAction.NONE
var offering_to_take: StringName = &""
var used_offerings: Array[StringName] = []
var burner_checked := false
var well_checked := false
var heard_giggle := false
var scare_sequence: Tween
var scare_caption := ""
var shelf_lifted := false
var slips_read := false
var vessel_at_burner := false
var vessel_opened := false
var bedroom_echo_seen := false
var returned_to_hall_after_burn := false
var reading_note := false
var tape_chapter := 1
var tape_line := -1
var tape_paused := false
var tape_signal_time := 0.0
var tape_lock := 0.0
var tape_elapsed := 0.0
var hotspots: Array[Button] = []
var labeled_hotspot: Button
var inspection_tween: Tween
var text_reveal: Tween
var intro_time := 0.0
var intro_glitch_started := false
var seen_arrivals: Array[Screen] = []
var confession_resume_pending := false
var first_watcher_seen := false
var passing_watcher_seen := false
var wardrobe_pressure_started := false
var shelf_wedge_found := false
var matches_found := false
var tea_cups := 0
var credits_roll: Tween
var action_underline_width := 0.0
var audio_fade: Tween
var rain_stopped := false
var arriving := false
var blackout := false


func _ready() -> void:
	%Begin.pressed.connect(_show_screen.bind(Screen.INTRO))
	%Quit.pressed.connect(get_tree().quit)
	%TitleSettings.pressed.connect(_show_panel.bind(Overlay.SETTINGS, %TitleSettings))
	%Pause.pressed.connect(_show_panel.bind(Overlay.PAUSE, %Pause))
	%Resume.pressed.connect(_close_panel)
	%ReturnToTitle.pressed.connect(_return_to_title)
	%ReplayInstruction.pressed.connect(_review_instruction)
	%AdvanceBackdrop.pressed.connect(_advance)
	turn_page.pressed.connect(_advance)
	action.pressed.connect(_advance.bind(true))
	%TapeDeck.pressed.connect(_use_tape_deck)
	%TapeBack.pressed.connect(_close_tape)
	%TapeEarlier.pressed.connect(func(): _open_tape(tape_chapter - 1))
	%TapeLater.pressed.connect(func(): _open_tape(tape_chapter + 1))
	%InventoryButton.pressed.connect(_show_panel.bind(Overlay.INVENTORY, %InventoryButton))
	inventory.closed.connect(_close_panel)
	inventory.hold_changed.connect(_hold_item)
	tape_sound.finished.connect(_on_tape_sound_finished)
	car_exit.finished.connect(_finish_arrival)
	pour_sound.stream = POUR
	scare_sound.finished.connect(_clear_scare_caption)
	picture.set_shader_parameter("offering_cup", inventory.OFFERING_ICONS[&"cups"])
	picture.set_shader_parameter("offering_tea", inventory.OFFERING_ICONS[&"tea"])
	picture.set_shader_parameter("offering_wine", inventory.OFFERING_ICONS[&"wine"])
	picture.set_shader_parameter("offering_paper", inventory.OFFERING_ICONS[&"paper"])
	picture.set_shader_parameter("late_vessel", VESSEL)
	picture.set_shader_parameter("watcher", WATCHER)
	picture.set_shader_parameter("reveal_stare", REVEAL_STARE)
	memory_percussion.stream = preload("res://assets/audio/yard-percussion.wav")
	music.play()
	_enter_screen(Screen.TITLE)
	%Begin.grab_focus()


func _process(delta: float) -> void:
	if screen == Screen.INTRO:
		if not blackout:
			_update_intro(delta)
		return
	if blackout:
		return
	if panel == Overlay.NONE:
		scene_time += delta
		picture.set_shader_parameter("scene_time", scene_time)
		if screen == Screen.DRIVE:
			_update_road_motion(delta)
		text_signal.set_shader_parameter("scene_time", scene_time)
		if inspection_prop.visible:
			prop_picture.set_shader_parameter("scene_time", scene_time)
	if screen == Screen.TAPE and panel == Overlay.NONE:
		_update_tape_signal(delta)
		var deck: Button = %TapeDeck
		%DeckLabel.visible = not deck.disabled and (deck.is_hovered() or (keyboard_navigation and deck.has_focus()))
	if panel == Overlay.NONE and screen != Screen.TITLE:
		_update_hotspot_label(delta)
		_update_scene_choice(delta)
		var hint: Label = %ContinueHint
		var focused := keyboard_navigation and turn_page.has_focus()
		hint.modulate = Color(1.22, 1.22, 1.22) if focused else Color.WHITE


func _input(event: InputEvent) -> void:
	if blackout:
		get_viewport().set_input_as_handled()
		return
	var was_keyboard := keyboard_navigation
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		keyboard_navigation = false
	elif event.is_action_pressed("ui_focus_next") or event.is_action_pressed("ui_focus_prev") \
			or event.is_action_pressed("ui_accept") \
			or event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down") \
			or event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
		keyboard_navigation = true
	if keyboard_navigation != was_keyboard:
		get_tree().call_group(&"text_actions", &"set_keyboard_navigation", keyboard_navigation)


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_I:
		if panel == Overlay.INVENTORY:
			_close_panel()
		elif panel == Overlay.NONE and %InventoryButton.is_visible_in_tree():
			_show_panel(Overlay.INVENTORY, %InventoryButton)
		else:
			return
		get_viewport().set_input_as_handled()
		return
	if not event.is_action_pressed("ui_cancel"):
		return
	get_viewport().set_input_as_handled()
	if panel != Overlay.NONE:
		_close_panel()
	elif not blackout and screen not in [Screen.TITLE, Screen.INTRO, Screen.LISTEN, Screen.REVEAL, Screen.OUTRO_BLACK, Screen.CREDITS, Screen.END_CARD]:
		_show_panel(Overlay.PAUSE, get_viewport().gui_get_focus_owner())


func _advance(perform_action := false) -> void:
	if panel != Overlay.NONE or blackout or arriving or screen == Screen.TITLE or screen == Screen.INTRO:
		return
	if not perform_action and text_reveal and text_reveal.is_running():
		_finish_text_reveal()
		return
	if screen == Screen.TAPE:
		if tape_line >= 0 and not tape_paused:
			_next_tape_line()
		return
	if screen == Screen.DRIVE and drive_part == DrivePart.RINGING:
		if perform_action:
			_answer_phone()
		return
	if perform_action and ritual_action != RitualAction.NONE:
		_perform_ritual_action()
		return
	if not inspection_lines.is_empty():
		inspection_index += 1
		if inspection_index < inspection_lines.size():
			var attributed := "Dad’s note" if reading_note and inspection_index < 2 else ""
			_set_line(inspection_lines[inspection_index], attributed)
			if inspecting_album and inspection_index == 2:
				page_turn.play()
		else:
			if reading_note and stage == Stage.NOTE:
				stage = Stage.WATCH_TAPE
			reading_note = false
			ritual_action = RitualAction.NONE
			inspection_lines.clear()
			%PortraitInscription.hide()
			%ReceiptInscription.hide()
			_set_inspection_zoom(Vector2(0.5, 0.5), 0.0, false, true)
			_show_exploration()
		return
	var lines := screen_lines
	if narration_index < lines.size():
		narration_index += 1
		if narration_index < lines.size():
			_show_story_beat(lines[narration_index])
			if screen == Screen.MEMORY and narration_index == 5:
				_start_chant()
			elif screen in [Screen.MEMORY, Screen.PEEK] and chant.playing:
				_show_sound_cue("Muffled chanting behind the door")
			if screen == Screen.PEEK and narration_index == 1:
				_play_scare(WRIST_CHAIN, -17.0, "Soft metal clicks behind the door")
			elif screen == Screen.BEDROOM_ECHO and narration_index == 2:
				_play_scare(WOOD_RUN, -12.0, "Light footsteps on this side of the door")
			if screen == Screen.HALL and stage == Stage.FINAL_TAPE and narration_index == 1:
				_queue_scare(WRIST_CHAIN, -22.0, "Faint metal clicks deeper in the house", 0.9)
			elif screen == Screen.HALL and not rain_stopped and narration_index == lines.size() - 1:
				rain_stopped = true
				_mix_scene_audio()
		elif INSPECTIONS.has(screen):
			seen_arrivals.append(screen)
			_show_exploration()
		if narration_index < lines.size() or screen in [Screen.YARD, Screen.HALL, Screen.GUEST_BEDROOM]:
			return
	if screen in [Screen.MORNING, Screen.SOFA_MEMORY, Screen.RITUAL_MEMORY]:
		confession_resume_pending = true
		_show_screen(Screen.TAPE)
	elif screen == Screen.MEMORY:
		_show_memory_gap()
	elif screen == Screen.GUEST_BEDROOM:
		_show_exploration()
	elif screen == Screen.PEEK:
		_show_screen(Screen.MORNING)
	elif screen == Screen.BEDROOM_ECHO:
		_show_screen(Screen.GUEST_BEDROOM)
	elif screen == Screen.DRIVE:
		_continue_drive()
	elif screen == Screen.VESSEL_OPEN:
		vessel_opened = true
		_check_vessel_ready()
		_show_screen(Screen.BURN_AREA)
	elif screen == Screen.MARKED:
		stage = Stage.PLACE_PAPER
		_show_screen(Screen.HALL)
	elif screen == Screen.BURNING:
		stage = Stage.FINAL_TAPE
		_show_screen(Screen.BURN_AREA)
	elif screen == Screen.END_CARD and perform_action and action.visible:
		_return_to_title()


func _continue_drive() -> void:
	match drive_part:
		DrivePart.ROAD:
			drive_part = DrivePart.RINGING
			phone_ring.play()
			_set_line("Dad. I’ll pull over here.", "", "Phone ringing")
			_set_action_label("Answer the phone")
		DrivePart.CALL:
			drive_part = DrivePart.AFTER_CALL
			_start_road_lines(StoryText.AFTER_CALL)
		DrivePart.AFTER_CALL:
			_show_screen(Screen.YARD)


func _update_road_motion(delta: float) -> void:
	var target := 1.0 if drive_part in [DrivePart.ROAD, DrivePart.AFTER_CALL] else 0.0
	road_motion = move_toward(road_motion, target, delta / 1.1)
	var suspension := smoothstep(0.0, 1.0, road_motion)
	road_time += delta * suspension
	picture.set_shader_parameter("road_time", road_time)
	picture.set_shader_parameter("road_motion", suspension)
	engine.volume_db = lerpf(-17.0, 0.0, suspension)


func _answer_phone() -> void:
	drive_part = DrivePart.CALL
	phone_ring.stop()
	pickup.play()
	_start_road_lines(StoryText.PHONE_CALL)


func _start_road_lines(lines: Array) -> void:
	screen_lines = lines
	narration_index = 0
	_show_story_beat(lines[0])
	_set_action_label("")
	turn_page.grab_focus()


func _show_screen(next: Screen) -> void:
	if blackout:
		return
	blackout = true
	%Objective.hide()
	%SceneCurtain.mouse_filter = Control.MOUSE_FILTER_STOP
	var focus := get_viewport().gui_get_focus_owner()
	if focus:
		focus.release_focus()
	var through_door: bool = next in DOORS.get(screen, []) or screen in DOORS.get(next, [])
	var fade := create_tween()
	if screen == Screen.INTRO or next == Screen.OUTRO_BLACK:
		%SceneCurtain.color.a = 1.0
	else:
		if screen == Screen.HALL and next == Screen.KITCHEN and stage == Stage.TAKE_VESSEL and not passing_watcher_seen:
			passing_watcher_seen = true
			_show_watcher(Vector4(0.862, 0.187, 0.065, 0.215), 0.86)
			fade.tween_interval(0.20)
		fade.tween_property(%SceneCurtain, "color:a", 1.0, 0.23)
	if next == Screen.LISTEN:
		fade.tween_callback(_play_scare.bind(GRANDPA_LAUGH, -5.0, "A laugh to your left"))
		fade.tween_interval(0.78)
	if through_door:
		if screen == Screen.YARD and next == Screen.HALL:
			fade.tween_callback(concrete_steps.play)
			fade.tween_interval(concrete_steps.stream.get_length())
		fade.tween_callback(wood_door.play)
		fade.tween_interval(maxf(wood_door.stream.get_length() - 1.0, 0.0))
	if screen == Screen.BURNING and scare_sound.playing:
		var remaining := scare_sound.stream.get_length() - scare_sound.get_playback_position()
		fade.tween_interval(maxf(remaining - 0.45, 0.0))
	fade.tween_callback(_enter_screen.bind(next))
	if screen == Screen.DRIVE and next == Screen.YARD:
		fade.tween_interval(maxf(car_exit.stream.get_length() - 1.0, 0.0))
	var fade_in := 0.55 if through_door or next == Screen.YARD else 0.37
	if next == Screen.REVEAL:
		fade_in = REVEAL_FADE
	fade.tween_property(%SceneCurtain, "color:a", 0.0, fade_in)
	fade.tween_callback(_finish_transition)


func _enter_screen(next: Screen) -> void:
	if next not in [Screen.LISTEN, Screen.REVEAL]:
		_stop_scare()
	memory_percussion.stop()
	picture.set_shader_parameter("watcher_strength", 0.0)
	picture.set_shader_parameter("reveal_grandpa", 0.0)
	picture.set_shader_parameter("reveal_ah_ma", 0.0)
	var previous := screen
	if next == Screen.TITLE:
		seen_arrivals.clear()
		confession_resume_pending = false
		first_watcher_seen = false
		passing_watcher_seen = false
		wardrobe_pressure_started = false
		shelf_wedge_found = false
		matches_found = false
		tea_cups = 0
		rain_stopped = false
		stage = Stage.ARRIVAL
		collected_items.clear()
		used_offerings.clear()
		burner_checked = false
		well_checked = false
		heard_giggle = false
		shelf_lifted = false
		slips_read = false
		vessel_at_burner = false
		vessel_opened = false
		bedroom_echo_seen = false
		returned_to_hall_after_burn = false
		held_item = &""
	screen = next
	if screen == Screen.HALL and stage == Stage.ARRIVAL:
		stage = Stage.RESPECTS
	%CreditsRoll.visible = screen == Screen.CREDITS
	%EndCard.visible = screen == Screen.END_CARD
	if credits_roll and credits_roll.is_valid():
		credits_roll.kill()
	if screen == Screen.DRIVE:
		drive_part = DrivePart.ROAD
		road_motion = 1.0
		road_time = 0.0
		_update_road_motion(0.0)
	scene_time = 0.0
	intro_time = 0.0
	intro_glitch_started = false
	narration_index = 0
	inspection_lines.clear()
	inspection_prop.hide()
	inspecting_album = false
	reading_note = false
	ritual_action = RitualAction.NONE
	_clear_hotspots()
	%PortraitInscription.hide()
	%ReceiptInscription.hide()
	_set_inspection_zoom(Vector2(0.5, 0.5), 0.0, true)
	var view: Array = VIEWS[next]
	var on_title := screen == Screen.TITLE
	var on_intro := screen == Screen.INTRO
	backdrop.visible = view[0] != null
	backdrop.texture = view[0]
	_apply_room_state()
	screen_lines = NARRATION.get(next, [])
	if screen in [Screen.YARD, Screen.HALL] and seen_arrivals.has(screen):
		screen_lines = []
	if screen == Screen.HALL and stage == Stage.FINAL_TAPE and not returned_to_hall_after_burn:
		returned_to_hall_after_burn = true
		screen_lines = StoryText.HALL_AFTER_BURN
	if screen == Screen.GUEST_BEDROOM and not seen_arrivals.has(screen):
		screen_lines = StoryText.BEDROOM_ARRIVAL
	elif screen == Screen.SITTING and not seen_arrivals.has(screen) and stage == Stage.NOTE:
		screen_lines = StoryText.SITTING_ARRIVAL
	if screen == Screen.WARDROBE and shelf_lifted and not seen_arrivals.has(Screen.WARDROBE):
		screen_lines = StoryText.WARDROBE_RAISED
	_show_story_beat(view[1] if screen_lines.is_empty() else screen_lines[0])
	if screen == Screen.PEEK and chant.playing:
		_show_sound_cue("Muffled chanting behind the door")
	_set_action_label("")
	opening_title.visible = on_title
	menu_signal.visible = on_title
	story.visible = not on_title and not on_intro
	%Intro.visible = on_intro
	if on_intro:
		_update_intro(0.0)
	%TitleShade.visible = on_title
	%ReadingShade.modulate.a = 0.43 if screen == Screen.REVEAL else 1.0
	%TapePanel.visible = screen == Screen.TAPE
	%TVSignal.visible = screen == Screen.TAPE
	%Pause.visible = screen not in [Screen.LISTEN, Screen.REVEAL, Screen.OUTRO_BLACK, Screen.CREDITS, Screen.END_CARD]
	if screen == Screen.TAPE:
		%TapePicture.texture = TAPE_FRAME
		_update_tape_controls()
		_update_tape_signal(0.0)
	%ActionMarker.modulate.a = 0.0
	picture.set_shader_parameter("scene_time", 0.0)
	picture.set_shader_parameter("unease", 1.0 if screen == Screen.PEEK else 0.5 if screen == Screen.MEMORY else 0.0)
	picture.set_shader_parameter("driving", screen == Screen.DRIVE)
	_update_scene_audio(previous)

	if INSPECTIONS.has(screen) and screen_lines.is_empty():
		narration_index = screen_lines.size()
		_show_exploration()
	_update_objective()


func _finish_transition() -> void:
	blackout = false
	%SceneCurtain.color.a = 0.0
	%SceneCurtain.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if screen == Screen.WARDROBE and shelf_lifted and not seen_arrivals.has(Screen.WARDROBE):
		_play_scare(BOARD_LIFT, -6.5, "")
	elif screen == Screen.WARDROBE and not shelf_lifted and not wardrobe_pressure_started:
		wardrobe_pressure_started = true
		_queue_scare(WOOD_RUN, -17.0, "Faint steps out in the hall", 2.0)
		scare_sequence.tween_interval(3.0)
		scare_sequence.tween_callback(_play_scare.bind(WOOD_RUN, -7.0, "Footsteps just outside the room"))
		scare_sequence.tween_interval(1.7)
		scare_sequence.tween_callback(_play_scare.bind(FAR_DOOR_SLAM, -9.0, "The door bangs behind you"))
	elif screen == Screen.VESSEL_OPEN:
		_play_scare(VESSEL_LID, -7.0, "Ceramic scrapes against ceramic")
	elif screen == Screen.MARKED:
		_play_scare(RITE_CHANT, -14.0, "A familiar cadence under your breath")
	elif screen == Screen.BURNING:
		match_strike.play()
		_play_scare(OFFERING_FIRE, -7.0, "Dry paper crackles in the burner")
	elif screen == Screen.RITUAL_MEMORY:
		memory_percussion.play()
		_play_scare(RITE_CHANT, -8.5, "Drum, gong and chanting in the yard")
	elif screen == Screen.TAPE and confession_resume_pending:
		confession_resume_pending = false
		_next_tape_line(true)
	elif screen == Screen.LISTEN:
		ritual_action = RitualAction.TURN_LEFT
		_set_action_label("Look toward the doorway")
		action.grab_focus()
	elif screen == Screen.REVEAL:
		_start_final_gaze()
	elif screen == Screen.OUTRO_BLACK:
		scare_sequence = create_tween()
		scare_sequence.tween_interval(OUTRO_BLACK_HOLD)
		scare_sequence.tween_callback(_show_screen.bind(Screen.CREDITS))
	elif screen == Screen.CREDITS:
		_start_credits()
	elif screen == Screen.END_CARD:
		_set_action_label("Return to title")
		action.grab_focus()
	_update_objective()
	if not arriving and screen not in [Screen.INTRO, Screen.LISTEN, Screen.REVEAL, Screen.OUTRO_BLACK, Screen.CREDITS, Screen.END_CARD]:
		var target := hotspots[0] if keyboard_navigation and not hotspots.is_empty() else _default_focus()
		target.grab_focus()


func _start_final_gaze() -> void:
	var laugh_left := 0.0
	if scare_sound.playing and scare_sound.stream == GRANDPA_LAUGH:
		laugh_left = maxf(0.0, GRANDPA_LAUGH.get_length() - scare_sound.get_playback_position())
	scare_sequence = create_tween()
	scare_sequence.tween_interval(laugh_left + REVEAL_SILENCE)
	scare_sequence.tween_method(func(weight: float):
		picture.set_shader_parameter("reveal_grandpa", weight), 0.0, 1.0, 0.40)
	scare_sequence.tween_interval(0.32)
	scare_sequence.tween_method(func(weight: float):
		picture.set_shader_parameter("reveal_ah_ma", weight), 0.0, 1.0, 0.58)
	scare_sequence.tween_interval(0.72)
	scare_sequence.tween_callback(_show_final_line)
	scare_sequence.tween_interval(FINAL_LINE_HOLD)
	scare_sequence.tween_callback(_show_screen.bind(Screen.OUTRO_BLACK))


func _show_final_line() -> void:
	_set_line(StoryText.FINAL_LINE, "Grandpa?")
	_finish_text_reveal()


func _start_credits() -> void:
	var roll: Label = %CreditsRoll
	roll.position.y = 630.0
	roll.modulate.a = 0.0
	credits_roll = create_tween().set_parallel()
	credits_roll.tween_property(roll, "position:y", -roll.size.y, 22.0)
	credits_roll.tween_property(roll, "modulate:a", 1.0, 1.25)
	credits_roll.chain().tween_callback(_show_screen.bind(Screen.END_CARD))


func _update_scene_audio(previous: Screen) -> void:
	arriving = previous == Screen.DRIVE and screen == Screen.YARD
	if screen != Screen.DRIVE:
		phone_ring.stop()
	if screen not in [Screen.MEMORY, Screen.PEEK]:
		chant.stop()
	if screen == Screen.DRIVE:
		engine.volume_db = 0.0
		engine.play()
	elif arriving:
		_set_line("")
		_set_action_label("")
		car_exit.play()
	else:
		engine.stop()
		car_exit.stop()
	if screen == Screen.TITLE:
		wood_door.stop()
		settle.stop()
		pickup.stop()
		page_turn.stop()
		concrete_steps.stop()
		cough.stop()
		tape_sound.stop()
		match_strike.stop()
		pour_sound.stop()
	if stage >= Stage.FINAL_TAPE or screen in [Screen.TITLE, Screen.INTRO, Screen.DRIVE, Screen.YARD, Screen.BURN_AREA, Screen.RITUAL_MEMORY, Screen.BURNING]:
		room_tone.stop()
	elif not room_tone.playing:
		room_tone.play()
	_mix_scene_audio()


func _mix_scene_audio() -> void:
	if audio_fade and audio_fade.is_valid():
		audio_fade.kill()
	audio_fade = create_tween().set_parallel()
	var music_level := -35.0
	match screen:
		Screen.TITLE: music_level = -16.0
		Screen.INTRO, Screen.DRIVE: music_level = -22.0
		Screen.MEMORY, Screen.PEEK, Screen.MORNING, Screen.SOFA_MEMORY: music_level = -37.0
		Screen.TAPE: music_level = -49.0
	if stage >= Stage.FINAL_TAPE:
		music_level = -80.0
	audio_fade.tween_property(music, "volume_db", music_level, 0.65)
	var rain_level := -60.0
	if not rain_stopped:
		match screen:
			Screen.DRIVE: rain_level = -14.0
			Screen.YARD, Screen.BURN_AREA: rain_level = -3.0
			Screen.HALL: rain_level = -17.0
	var night_level := -60.0
	if screen == Screen.BURN_AREA or (screen == Screen.YARD and not arriving):
		night_level = -5.0 if rain_stopped else -18.0
	elif screen == Screen.HALL and rain_stopped:
		night_level = -18.0
	var drip_level := -60.0
	if screen == Screen.BATHROOM:
		drip_level = -9.0
	elif rain_stopped and screen in [Screen.YARD, Screen.BURN_AREA]:
		drip_level = -24.0
	if stage >= Stage.FINAL_TAPE:
		rain_level = -60.0
		night_level = -60.0
		drip_level = -60.0
	_fade_ambience(rain, rain_level)
	_fade_ambience(rural_night, night_level)
	_fade_ambience(water_drip, drip_level)
	if arriving:
		audio_fade.tween_property(engine, "volume_db", -46.0, 0.48)
		audio_fade.chain().tween_callback(engine.stop)
	room_tone.volume_db = -26.0 if screen == Screen.PEEK else -20.0


func _fade_ambience(player: AudioStreamPlayer, level: float) -> void:
	if level > -60.0 and not player.playing:
		player.volume_db = -60.0
		player.play()
	if player.playing:
		audio_fade.tween_property(player, "volume_db", level, 0.6)
		if level == -60.0:
			audio_fade.tween_callback(player.stop).set_delay(0.6)


func _finish_arrival() -> void:
	if not arriving or screen != Screen.YARD:
		return
	arriving = false
	_set_line(NARRATION[Screen.YARD][0], "", "Coughing")
	_set_action_label("")
	_update_objective()
	_mix_scene_audio()
	cough.play()
	if keyboard_navigation:
		turn_page.grab_focus()


func _start_chant() -> void:
	chant.play()
	_show_sound_cue("Muffled chanting behind the door")


func _show_sound_cue(description: String) -> void:
	%SoundCue.text = description
	%SoundCue.show()
	%ReadingShade.show()


func _show_story_beat(beat: Variant) -> void:
	if beat is String:
		_set_line(beat)
	else:
		var original: String = beat[2] if beat.size() > 2 else ""
		_set_line(beat[1], beat[0], "", original)


func _set_line(line: String, said_by: String = "", sound: String = "", original: String = "") -> void:
	caption.text = line
	original_caption.text = original
	original_caption.visible = not original.is_empty()
	var cue := scare_caption if sound.is_empty() else sound
	%SoundCue.text = cue
	%SoundCue.visible = not cue.is_empty()
	speaker.text = said_by
	speaker.visible = not said_by.is_empty()
	# The last English line stays at the same height when the caption wraps.
	var extra_height := float(maxi(caption.get_line_count() - 1, 0) * caption.get_line_height())
	caption.position.y = 72.0 - extra_height
	original_caption.position.y = 39.0 - extra_height
	speaker.position.y = (12.0 if original_caption.visible else 45.0) - extra_height
	var first_row := speaker.position.y if speaker.visible else caption.position.y
	%SoundCue.position.y = minf(556.0, textbox.position.y + first_row - 33.0)
	textbox.visible = not line.is_empty()
	%ReadingShade.visible = textbox.visible or %SoundCue.visible
	_finish_text_reveal()
	if textbox.visible:
		caption.visible_ratio = 0.0
		text_reveal = create_tween()
		var duration := minf(line.length() / TEXT_CHARACTERS_PER_SECOND, 1.0)
		text_reveal.tween_property(caption, "visible_ratio", 1.0, duration)
		if original_caption.visible:
			original_caption.visible_ratio = 0.0
			text_reveal.parallel().tween_property(original_caption, "visible_ratio", 1.0, duration)


func _finish_text_reveal() -> void:
	if text_reveal:
		text_reveal.kill()
	caption.visible_ratio = 1.0
	original_caption.visible_ratio = 1.0


func _update_intro(delta: float) -> void:
	intro_time += delta
	var glitch_time := intro_time - INTRO_FIRST_CARD_SECONDS
	var duration := intro_glitch.stream.get_length()
	if glitch_time >= 0.0 and not intro_glitch_started:
		intro_glitch_started = true
		intro_glitch.play()
	var changed := glitch_time >= duration
	var glitched := glitch_time >= 0.0 and not changed
	var fade_time := glitch_time - duration - INTRO_RED_HOLD_SECONDS
	var glitch_progress := clampf(glitch_time / duration, 0.0, 1.0)
	var english_warning := glitch_progress >= 0.58
	var english_opacity := smoothstep(0.58, 1.0, glitch_progress) if english_warning else 1.0 - smoothstep(0.0, 0.42, glitch_progress)
	var ink := Color("e7594f") if changed else Color("f1ece3")
	%IntroChinese.text = WARNING if changed else PROVERB
	%IntroEnglish.text = ("Those who come before sow calamity.\nThose who come after bear it."
		if english_warning else "Those who came before planted the trees.\nThose who came after rested in their shade.")
	if glitched:
		var frame := floori(glitch_time * 13.0)
		var settled := mini(floori(glitch_time / duration * WARNING.length()), WARNING.length() - 1)
		var corrupted := WARNING.substr(0, settled) + PROVERB.substr(settled)
		var index := settled + posmod(frame, WARNING.length() - settled)
		var source := WARNING if frame % 2 == 0 else PROVERB
		var scrambled := source.substr(posmod(frame * 7 + 2, source.length()), 1)
		%IntroChinese.text = corrupted.substr(0, index) + scrambled + corrupted.substr(index + 1)
		ink = Color("f1ece3").lerp(Color("e7594f"), glitch_time / duration)
	ink.a = smoothstep(0.0, 0.8, intro_time) * (1.0 - smoothstep(0.0, INTRO_FADE_SECONDS, fade_time))
	%IntroChinese.modulate = ink
	var english_ink := Color("e7594f") if english_warning else Color("f1ece3")
	english_ink.a = ink.a * english_opacity
	%IntroEnglish.modulate = english_ink
	if fade_time >= INTRO_FADE_SECONDS:
		_show_screen(Screen.DRIVE)


func _show_exploration() -> void:
	_apply_room_state()
	_set_line("")
	_set_action_label("")
	for entry: Array in INSPECTIONS[screen]:
		if screen == Screen.WARDROBE:
			var hidden: bool = entry[0] in ["Hospital slips", "Clay vessel"]
			if hidden != shelf_lifted or (entry[0] == "Clay vessel" and _vessel_taken()):
				continue
		if entry.size() > 3 and entry[3] is StringName and _offering_taken(entry[3]):
			continue
		for area: Rect2 in entry[1]:
			var hotspot := _add_hotspot(_hotspot_name(entry[0]), area, _inspect.bind(entry, area))
			hotspot.set_meta(&"scene_item", entry[0])
	if screen == Screen.GUEST_BEDROOM and stage >= Stage.RETURN_TO_WELL and not bedroom_echo_seen:
		_add_hotspot("Look back at the doorway", Rect2(28, 118, 118, 420), _look_back_at_doorway)
	if screen == Screen.HALL:
		if stage == Stage.RETURN_TO_TAPE and not first_watcher_seen:
			first_watcher_seen = true
			_show_watcher(Vector4(0.884, 0.187, 0.044, 0.135), 1.0)
			_play_scare(WRIST_CHAIN, -16.0, "A click in the doorway")
		if stage == Stage.PREPARE_OFFERINGS and _cups_placed():
			for cup in CUP_NAMES.size():
				var area := Rect2(387 + cup * 57, 343, 49, 53)
				_add_hotspot(CUP_NAMES[cup], area, _pour_at_cup.bind(cup, area))
	if RETURN_TO.has(screen):
		_add_hotspot("Go back", Rect2(0, 644, 1280, 76), _show_screen.bind(RETURN_TO[screen]))
	if keyboard_navigation and not hotspots.is_empty():
		hotspots[0].grab_focus()
	_update_objective()


func _add_hotspot(label: String, area: Rect2, activate: Callable) -> Button:
	var hotspot := Button.new()
	hotspot.position = area.position
	hotspot.size = area.size
	hotspot.accessibility_name = label
	hotspot.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	var empty := StyleBoxEmpty.new()
	for state in [&"normal", &"hover", &"pressed", &"focus"]:
		hotspot.add_theme_stylebox_override(state, empty)
	hotspot.pressed.connect(activate)
	%Hotspots.add_child(hotspot)
	hotspots.append(hotspot)
	return hotspot


func _look_back_at_doorway() -> void:
	bedroom_echo_seen = true
	_show_screen(Screen.BEDROOM_ECHO)


func _show_watcher(area: Vector4, strength: float) -> void:
	picture.set_shader_parameter("watcher_area", area)
	picture.set_shader_parameter("watcher_strength", strength)
	var glimpse := create_tween()
	glimpse.tween_interval(0.28)
	glimpse.tween_callback(picture.set_shader_parameter.bind("watcher_strength", 0.0))



func _show_memory_gap() -> void:
	_set_line("")
	_set_action_label("")
	if chant.playing:
		_show_sound_cue("Muffled chanting behind the door")
	var gap := _add_hotspot("Look under the door", Rect2(615, 465, 262, 103), _show_screen.bind(Screen.PEEK))
	if keyboard_navigation:
		gap.grab_focus()


func _inspect(entry: Array, area: Rect2) -> void:
	_clear_hotspots()
	var item: String = entry[0]
	if item == "TV and VHS deck" and stage >= Stage.WATCH_TAPE:
		_open_tape(_latest_tape_chapter())
		return
	if item == "Wardrobe" and stage >= Stage.TAKE_VESSEL:
		if not shelf_lifted:
			wood_door.play()
		_show_screen(Screen.WARDROBE)
		return
	inspecting_album = item == "Photo album and note"
	if entry[2].is_empty():
		_show_screen(entry[3] as Screen)
		return
	inspection_lines = entry[2].duplicate()
	inspection_index = 0
	var detail: Texture2D = INSPECTION_IMAGES.get(item)
	if entry.size() > 3 and entry[3] is StringName:
		offering_to_take = entry[3]
		detail = inventory.OFFERING_ICONS[offering_to_take]
		if stage == Stage.PREPARE_OFFERINGS:
			inspection_lines = [StoryText.OFFERING_ITEMS[offering_to_take][1]]
			ritual_action = RitualAction.TAKE_OFFERING
	if item == "Sitting-room cabinet" and stage == Stage.TAKE_PORTRAIT:
		detail = PORTRAIT_FRONT
	var label := _prepare_inspection(item)
	if item == "Incense and tin" and stage >= Stage.PLACE_INCENSE:
		detail = CHALK_TIN if stage == Stage.TAKE_CHALK else null
	elif item == "Hospital slips":
		detail = HOSPITAL_SLIPS
		page_turn.play()
	elif item == "Clay vessel":
		detail = VESSEL
		picture.set_shader_parameter("vessel_location", 0)
	inspection_prop.texture = detail
	inspection_prop.visible = detail != null
	if detail:
		prop_picture.set_shader_parameter("scene_time", scene_time)
		_set_inspection_zoom(Vector2(0.5, 0.5), 0.0)
	else:
		var zoom := 0.09 if item == "Ancestor altar" else 0.15
		_set_inspection_zoom(area.get_center() / Vector2(1280.0, 720.0), zoom)
	_set_line(inspection_lines[0], "Dad’s note" if reading_note else "")
	_set_action_label(label)
	if ritual_action in [RitualAction.PLACE, RitualAction.PLACE_PORTRAIT, RitualAction.USE_OFFERING,
			RitualAction.SET_VESSEL, RitualAction.PLACE_PAPER]:
		_perform_ritual_action()
	_update_objective()
	_default_focus().grab_focus()


func _hotspot_name(item: String) -> String:
	match item:
		"Wardrobe":
			if stage >= Stage.TAKE_VESSEL: return "Open Ah Ma’s wardrobe"
		"Well":
			if stage == Stage.RETURN_TO_WELL: return "Look over the rim"
		"Incense and tin":
			if stage == Stage.TAKE_CHALK: return "Small tin"
		"Burner":
			if stage == Stage.TAKE_VESSEL and held_item == &"vessel": return "Set down the vessel"
			if stage == Stage.TAKE_VESSEL and vessel_at_burner: return "Inspect the vessel"
			if stage == Stage.PLACE_PAPER and held_item == &"paper": return "Place the joss paper"
			if stage == Stage.BURN_OFFERING: return "Burn the offering"
	if item == "TV and VHS deck" and stage >= Stage.WATCH_TAPE:
		return "Ah Ma’s tape · Chapter %d" % _latest_tape_chapter()
	if item == "Sitting-room cabinet" and stage == Stage.TAKE_PORTRAIT:
		return "Find Grandpa’s portrait"
	if item == "Ancestor altar":
		if stage == Stage.RESPECTS:
			return "Speak to Ah Ma"
		if stage == Stage.PLACE_INCENSE and held_item == &"incense":
			return "Place incense"
		if stage == Stage.PLACE_PORTRAIT and held_item == &"portrait":
			return "Place Grandpa’s portrait"
		if stage == Stage.MARK_FOREHEAD and held_item == &"chalk":
			return "Mark your forehead"
		if stage == Stage.PREPARE_OFFERINGS:
			if held_item == &"cups":
				return "Set out the three cups"
	if item == "Photo album and note" and stage == Stage.NOTE:
		return "Dad’s note and family album"
	return item


func _prepare_inspection(item: String) -> String:
	if ritual_action == RitualAction.TAKE_OFFERING:
		return "Take " + String(StoryText.OFFERING_ITEMS[offering_to_take][0]).to_lower()
	match item:
		"Cloth bag":
			if stage in [Stage.TAKE_INCENSE, Stage.PLACE_INCENSE, Stage.LIGHT_INCENSE] and not matches_found:
				matches_found = true
				pickup.play()
				inspection_lines = ["Her matches were in the bottom of the bag."]
		"Woven box":
			if not shelf_wedge_found and not shelf_lifted:
				shelf_wedge_found = true
				inspection_lines = ["There’s a small wooden wedge under the sewing things. It fits the gap by the loose shelf.", "I took it with me."]
		"Red cloth tab":
			if not shelf_wedge_found:
				inspection_lines = ["The tab lifts the board a little, then it drops. I need something small to hold it up."]
				return ""
			ritual_action = RitualAction.LIFT_BOARD
			return "Lift and brace the board"
		"Hospital slips":
			if stage >= Stage.RETURN_TO_WELL:
				inspection_lines = ["The last slip was folded inward. There was pencil writing on the back."]
				ritual_action = RitualAction.TURN_RECEIPT
				return "Turn over the slip"
			slips_read = true
			_check_vessel_ready()
		"Clay vessel":
			ritual_action = RitualAction.TAKE_VESSEL
			return "Take the vessel"
		"Well":
			if stage == Stage.RETURN_TO_WELL:
				inspection_lines = StoryText.WELL_TRACE.duplicate()
				_queue_scare(WELL_ROPE, -19.0, "The rope shifts against the rim", 1.1)
				stage = Stage.TAKE_CHALK
		"Burner":
			var burner_action := _prepare_burner()
			if stage >= Stage.TAKE_VESSEL:
				return burner_action
	if stage == Stage.PREPARE_OFFERINGS:
		if item == "Burner" and not burner_checked:
			burner_checked = true
			inspection_lines = StoryText.FIRST_BURNER.duplicate()
			_queue_scare(BURNER_SUSPENSE, -17.0, "", 0.66)
			_check_offerings_complete()
		elif item == "Well" and not well_checked:
			well_checked = true
			inspection_lines = StoryText.FIRST_WELL.duplicate()
			_queue_scare(WELL_SWELL, -14.0, "A low sound from inside the well", 0.86)
			_check_offerings_complete()
	if item == "Photo album and note" and stage >= Stage.NOTE:
		reading_note = true
		inspection_lines = StoryText.FATHERS_NOTE.duplicate()
	elif item == "Sitting-room cabinet":
		if stage == Stage.TAKE_PORTRAIT:
			inspection_lines = [StoryText.PORTRAIT_ARRIVAL]
			ritual_action = RitualAction.TURN_PORTRAIT
			return "Turn the frame over"
		if stage >= Stage.PLACE_PORTRAIT:
			inspection_lines = ["There’s a clean spot where the frame was."]
	elif item == "Family portraits" and stage >= Stage.OFFERINGS_TAPE:
		inspection_lines = ["Grandpa’s back with the rest of the family."]
	elif item == "Ancestor altar":
		match stage:
			Stage.RESPECTS:
				stage = Stage.NOTE
				inspection_lines = StoryText.ANCESTORS.duplicate()
			Stage.PLACE_INCENSE:
				if held_item != &"incense":
					inspection_lines = ["I need to hold the incense first. It’s in my inventory."]
					return ""
				inspection_lines = ["There’s room for the three sticks in the ash."]
				ritual_action = RitualAction.PLACE
				return ""
			Stage.LIGHT_INCENSE:
				if not matches_found:
					inspection_lines = ["I need the matches from Ah Ma’s market bag."]
					return ""
				inspection_lines = ["The sticks are upright in the ash."]
				ritual_action = RitualAction.LIGHT
				return "Light incense"
			Stage.PLACE_PORTRAIT:
				if held_item == &"portrait":
					ritual_action = RitualAction.PLACE_PORTRAIT
				else:
					inspection_lines = ["There’s space beside the incense burner. I need to hold the portrait from my inventory first."]
			Stage.MARK_FOREHEAD:
				if held_item == &"chalk":
					inspection_lines = ["I brought the tin up beside the incense. The lid still had dust around the edge."]
					ritual_action = RitualAction.MARK_FOREHEAD
					return "Mark your forehead"
				inspection_lines = ["I should take out the small tin before I try what she showed me."]
			Stage.PREPARE_OFFERINGS:
				if held_item == &"cups":
					ritual_action = RitualAction.USE_OFFERING
				elif _cups_placed():
					inspection_lines = ["Grandpa’s cup should be the one with the chip."]
				else:
					inspection_lines = ["There’s room along the front edge for the three cups."]
			_:
				if stage >= Stage.OFFERINGS_TAPE:
					inspection_lines = ["Grandpa’s portrait stands beside the incense burner."]
				elif stage >= Stage.RETURN_TO_TAPE:
					inspection_lines = ["The incense is still burning."]
	elif item == "Incense and tin":
		if stage == Stage.TAKE_INCENSE:
			inspection_lines = [StoryText.INCENSE_BUNDLE]
			ritual_action = RitualAction.TAKE
			return "Take three sticks"
		if stage == Stage.TAKE_CHALK:
			inspection_lines = StoryText.CHALK_FOUND.duplicate()
			ritual_action = RitualAction.TAKE_CHALK
			return "Take the tin"
		if stage >= Stage.MARK_FOREHEAD:
			inspection_lines = ["Only the ring the tin left in the dust was still there."]
		elif stage >= Stage.PLACE_INCENSE:
			inspection_lines = ["The old tin is still on the dresser."]
	return ""


func _prepare_burner() -> String:
	match stage:
		Stage.TAKE_VESSEL:
			if held_item == &"vessel":
				ritual_action = RitualAction.SET_VESSEL
				return ""
			if vessel_at_burner and not vessel_opened:
				inspection_lines = ["I could get a finger under the lip. The lid moved a little before it caught."]
				ritual_action = RitualAction.OPEN_VESSEL
				return "Look inside"
		Stage.PLACE_PAPER:
			if held_item == &"paper":
				ritual_action = RitualAction.PLACE_PAPER
			else:
				inspection_lines = ["I’d left room beside the vessel for the paper."]
			return ""
		Stage.BURN_OFFERING:
			inspection_lines = ["I lowered the jar into the burner, tucked the paper against the clay, and took out a match."]
			ritual_action = RitualAction.BURN_OFFERING
			return "Burn the offering"
	if stage >= Stage.FINAL_TAPE:
		inspection_lines = ["A low pile of ash. I waited for the sound of the trees to come back."]
	elif vessel_at_burner:
		inspection_lines = ["The lid had settled back into its groove. I left it there."]
	return ""


func _perform_ritual_action() -> void:
	match ritual_action:
		RitualAction.TURN_LEFT:
			_show_screen(Screen.REVEAL)
			return
		RitualAction.TURN_RECEIPT:
			inspection_prop.texture = RECEIPT_BACK
			%ReceiptInscription.show()
			page_turn.play()
			inspection_lines = StoryText.RECEIPT_BACK.duplicate()
		RitualAction.LIFT_BOARD:
			shelf_lifted = true
			_show_screen(Screen.WARDROBE)
			return
		RitualAction.TAKE_VESSEL:
			_take_finale_item(&"vessel", "It took both hands. Something shifted, and I caught it against my knee.")
		RitualAction.SET_VESSEL:
			_consume_held_item()
			vessel_at_burner = true
			_play_scare(VESSEL_SET, -5.0, "A heavy knock against the concrete")
			inspection_lines = StoryText.VESSEL_PLACED.duplicate()
		RitualAction.OPEN_VESSEL:
			_show_screen(Screen.VESSEL_OPEN)
			return
		RitualAction.TAKE_CHALK:
			_take_finale_item(&"chalk", "I shut the lid. There was powder on my thumb.")
			stage = Stage.MARK_FOREHEAD
		RitualAction.MARK_FOREHEAD:
			_consume_held_item()
			_show_screen(Screen.MARKED)
			return
		RitualAction.PLACE_PAPER:
			_consume_held_item()
			stage = Stage.BURN_OFFERING
			page_turn.play()
			inspection_lines = ["I laid the paper close against the jar and reached for a match."]
		RitualAction.BURN_OFFERING:
			vessel_at_burner = false
			_show_screen(Screen.BURNING)
			return
		RitualAction.TAKE:
			stage = Stage.PLACE_INCENSE
			collected_items.append(&"incense")
			pickup.play()
			inspection_prop.hide()
			_set_inspection_zoom(Vector2(0.5, 0.5), 0.0)
			inspection_lines = ["I took three sticks for the altar."]
		RitualAction.PLACE:
			if held_item != &"incense" or not collected_items.has(&"incense"):
				return
			collected_items.erase(&"incense")
			held_item = &""
			stage = Stage.LIGHT_INCENSE
			inspection_lines = ["The sticks are upright in the ash." if matches_found else "I need Ah Ma’s matches."]
			if matches_found:
				ritual_action = RitualAction.LIGHT
				_apply_room_state()
				_set_line(inspection_lines[0])
				_set_action_label("Light incense")
				_update_objective()
				return
		RitualAction.LIGHT:
			stage = Stage.RETURN_TO_TAPE
			match_strike.play()
			inspection_lines = StoryText.INCENSE_LIT.duplicate()
		RitualAction.TURN_PORTRAIT:
			inspection_prop.texture = PORTRAIT_BACK
			%PortraitInscription.show()
			page_turn.play()
			ritual_action = RitualAction.TAKE_PORTRAIT
			inspection_lines = [StoryText.PORTRAIT_NOTE]
			_set_line(inspection_lines[0])
			_set_action_label("Take Grandpa’s portrait")
			return
		RitualAction.TAKE_PORTRAIT:
			stage = Stage.PLACE_PORTRAIT
			collected_items.append(&"portrait")
			pickup.play()
			%PortraitInscription.hide()
			inspection_prop.hide()
			_set_inspection_zoom(Vector2(0.5, 0.5), 0.0)
			inspection_lines = ["I folded the stand flat and picked up the frame."]
		RitualAction.TAKE_OFFERING:
			_take_offering()
		RitualAction.USE_OFFERING:
			_use_offering()
		RitualAction.PLACE_PORTRAIT:
			if held_item != &"portrait" or not collected_items.has(&"portrait"):
				return
			collected_items.erase(&"portrait")
			held_item = &""
			stage = Stage.OFFERINGS_TAPE
			settle.play()
			inspection_lines = StoryText.PORTRAIT_PLACED.duplicate()
	ritual_action = RitualAction.NONE
	inspection_index = 0
	_apply_room_state()
	_set_line(inspection_lines[0])
	_set_action_label("")
	_update_objective()


func _vessel_taken() -> bool:
	return collected_items.has(&"vessel") or vessel_at_burner or vessel_opened


func _check_vessel_ready() -> void:
	if stage == Stage.TAKE_VESSEL and vessel_opened and slips_read:
		stage = Stage.PREPARATION_TAPE


func _take_finale_item(item: StringName, line: String) -> void:
	collected_items.append(item)
	pickup.play()
	inspection_prop.hide()
	_set_inspection_zoom(Vector2(0.5, 0.5), 0.0)
	inspection_lines = [line]


func _consume_held_item() -> void:
	collected_items.erase(held_item)
	held_item = &""


func _offering_taken(item: StringName) -> bool:
	return collected_items.has(item) or used_offerings.has(item)


func _cups_placed() -> bool:
	return used_offerings.has(&"cups")


func _take_offering() -> void:
	collected_items.append(offering_to_take)
	pickup.play()
	inspection_lines = [StoryText.OFFERING_ITEMS[offering_to_take][2]]
	inspection_prop.hide()
	_set_inspection_zoom(Vector2(0.5, 0.5), 0.0)
	if not heard_giggle:
		heard_giggle = true
		inspection_lines.append("When my cousins stayed over, we used to sneak in here after bedtime. I still knew which boards to step over.")
		_queue_scare(GIGGLE, -8.0, "A faint laugh beyond the kitchen wall", 0.72)
	_check_offerings_complete()


func _use_offering() -> void:
	used_offerings.append(&"cups")
	_consume_held_item()
	settle.play()
	inspection_lines = [StoryText.CUPS_PLACED]


func _pour_at_cup(cup: int, area: Rect2) -> void:
	_clear_hotspots()
	inspection_prop.hide()
	inspection_index = 0
	_set_inspection_zoom(area.get_center() / Vector2(1280.0, 720.0), 0.1)
	var chipped := cup == 1
	var cup_bit := 1 if cup == 0 else 2
	var first_pour := tea_cups == 0 and not used_offerings.has(&"wine")
	var filled := used_offerings.has(&"wine") if chipped else (tea_cups & cup_bit) != 0
	if filled:
		inspection_lines = ["There’s already a drink in this cup."]
	elif held_item == &"wine" and chipped:
		used_offerings.append(&"wine")
		_consume_held_item()
		pour_sound.play()
		inspection_lines = ["Rice wine for Grandpa."]
	elif held_item == &"tea" and not chipped:
		tea_cups |= cup_bit
		if tea_cups == 3:
			used_offerings.append(&"tea")
			_consume_held_item()
		pour_sound.play()
		inspection_lines = ["Tea for the family."]
	else:
		inspection_lines = ["A chip in the rim. This is Grandpa’s cup." if chipped else "The rim’s smooth. This one’s for the family."]
	if first_pour and (tea_cups != 0 or used_offerings.has(&"wine")):
		_queue_scare(WOOD_RUN, -7.0, "Footsteps behind you", pour_sound.stream.get_length() + 0.42)
		scare_sequence.tween_interval(WOOD_RUN.get_length() + 0.19)
		scare_sequence.tween_callback(_play_scare.bind(FAR_DOOR_SLAM, -9.0, "A door slams down the hall"))
	_check_offerings_complete()
	_apply_room_state()
	_set_line(inspection_lines[0])
	_set_action_label("")
	_update_objective()
	if keyboard_navigation:
		turn_page.grab_focus()


func _check_offerings_complete() -> void:
	if stage == Stage.PREPARE_OFFERINGS and used_offerings.size() == 3 and collected_items.has(&"paper") and burner_checked and well_checked:
		stage = Stage.INVITATION_TAPE


func _queue_scare(stream: AudioStream, level: float, cue: String, delay: float) -> void:
	_stop_scare()
	scare_sequence = create_tween()
	scare_sequence.tween_interval(delay)
	scare_sequence.tween_callback(_play_scare.bind(stream, level, cue))


func _play_scare(stream: AudioStream, level: float, cue: String) -> void:
	scare_caption = cue
	scare_sound.stream = stream
	scare_sound.volume_db = level
	scare_sound.play()
	if not cue.is_empty():
		_show_sound_cue(cue)


func _clear_scare_caption() -> void:
	if not scare_caption.is_empty() and %SoundCue.text == scare_caption:
		%SoundCue.hide()
	scare_caption = ""
	_update_objective()


func _stop_scare() -> void:
	if scare_sequence and scare_sequence.is_valid():
		scare_sequence.kill()
	scare_sound.stop()
	_clear_scare_caption()


func _apply_room_state() -> void:
	var hall := screen == Screen.HALL
	var house := INSPECTIONS.has(screen) or screen in [Screen.TAPE, Screen.VESSEL_OPEN, Screen.MARKED, Screen.BURNING]
	var dread := 0.0
	if house:
		dread = 0.32 if stage < Stage.RETURN_TO_TAPE else 0.54 if stage < Stage.TAKE_VESSEL else 0.84
	picture.set_shader_parameter("house_dread", dread)
	picture.set_shader_parameter("reveal_glitch", screen == Screen.REVEAL)
	picture.set_shader_parameter("vessel_location", 1 if screen == Screen.WARDROBE and shelf_lifted and not _vessel_taken()
		else 2 if screen == Screen.BURN_AREA and vessel_at_burner else 0)
	picture.set_shader_parameter("burner_paper", screen == Screen.BURN_AREA and stage == Stage.BURN_OFFERING)
	if screen == Screen.WARDROBE:
		backdrop.texture = WARDROBE_CAVITY if shelf_lifted else WARDROBE_SHELF
	picture.set_shader_parameter("family_cups", hall and _cups_placed())
	picture.set_shader_parameter("family_tea_left", hall and (tea_cups & 1) != 0)
	picture.set_shader_parameter("family_tea_right", hall and (tea_cups & 2) != 0)
	picture.set_shader_parameter("family_wine", hall and used_offerings.has(&"wine"))
	picture.set_shader_parameter("kitchen", screen == Screen.KITCHEN)
	if screen == Screen.KITCHEN:
		picture.set_shader_parameter("kitchen_items", Vector4(
			0.0 if _offering_taken(&"cups") else 1.0,
			0.0 if _offering_taken(&"tea") else 1.0,
			0.0 if _offering_taken(&"wine") else 1.0,
			0.0 if _offering_taken(&"paper") else 1.0,
		))
	var close_altar := screen == Screen.MARKED
	picture.set_shader_parameter("close_altar", close_altar)
	picture.set_shader_parameter("family_incense", (hall or close_altar) and stage >= Stage.LIGHT_INCENSE)
	picture.set_shader_parameter("family_incense_lit", stage >= Stage.RETURN_TO_TAPE)
	picture.set_shader_parameter("family_portrait", (hall or close_altar) and stage >= Stage.OFFERINGS_TAPE)
	if screen == Screen.BEDROOM and stage >= Stage.PLACE_INCENSE:
		backdrop.texture = BEDROOM_WITHOUT_INCENSE


func _update_objective() -> void:
	var label: Label = %Objective
	var task: String = OBJECTIVES.get(stage, "")
	if stage == Stage.ARRIVAL:
		if screen == Screen.YARD:
			task = "Enter through the front door."
	elif stage == Stage.LIGHT_INCENSE and not matches_found:
		task = "Find the matches in Ah Ma’s market bag."
	elif stage == Stage.PLACE_INCENSE and held_item == &"incense":
		task = "Place the incense in the burner."
	elif stage == Stage.PLACE_PORTRAIT and held_item == &"portrait":
		task = "Place Grandpa’s portrait beside the ancestor incense burner."
	elif stage == Stage.PREPARE_OFFERINGS:
		task = _offering_objective()
	elif stage == Stage.TAKE_VESSEL:
		task = _vessel_objective()
	elif stage == Stage.PLACE_PAPER and held_item != &"paper":
		task = "Hold the folded joss paper from your inventory."
	var free_view := INSPECTIONS.has(screen)
	label.text = task
	label.visible = free_view and not hotspots.is_empty() and not arriving and not task.is_empty() and not textbox.visible and not blackout
	%InventoryButton.visible = stage >= Stage.RESPECTS and free_view and not arriving and not textbox.visible
	%Carried.visible = %InventoryButton.visible and held_item != &""
	%HeldDash.visible = %Carried.visible
	%Carried.text = inventory.held_description(held_item) if %Carried.visible else ""
	%ReadingShade.visible = textbox.visible or label.visible or %SoundCue.visible


func _offering_objective() -> String:
	if held_item == &"cups":
		return "Set the cups at the front of the ancestor altar."
	if _cups_placed() and held_item in [&"tea", &"wine"]:
		return "Choose a cup for the %s at the ancestor altar." % ("tea" if held_item == &"tea" else "rice wine")
	if not _offering_taken(&"cups"):
		return "Find the three cups, tea, and rice wine in the kitchen."
	if not _cups_placed():
		return "Hold the three cups and set them on the ancestor altar."
	if not _offering_taken(&"tea") or not _offering_taken(&"wine"):
		return "Collect the tea and rice wine from the kitchen counter."
	if used_offerings.size() < 3:
		return "Hold each drink and pour it at the ancestor altar."
	if not _offering_taken(&"paper"):
		return "Take the folded joss paper from the kitchen shelf."
	if not burner_checked:
		return "Check the covered burner beyond the kitchen."
	return "Look into the old well in the bathroom."


func _vessel_objective() -> String:
	if vessel_opened:
		return "Read the papers under the wardrobe shelf."
	if vessel_at_burner:
		return "Look inside the vessel at the covered burner."
	if collected_items.has(&"vessel"):
		return "Hold the vessel and set it down by the covered burner."
	if shelf_lifted:
		return "Take the vessel and inspect the papers beneath the board."
	if screen == Screen.WARDROBE:
		return "Look closely at the bottom of the wardrobe."
	return "Find where Ah Ma hid the jar in her wardrobe."


func _hold_item(item: StringName) -> void:
	if item != &"" and not collected_items.has(item):
		return
	held_item = item
	if INSPECTIONS.has(screen):
		for hotspot in hotspots:
			if hotspot.has_meta(&"scene_item"):
				hotspot.accessibility_name = _hotspot_name(hotspot.get_meta(&"scene_item"))
		labeled_hotspot = null
	_update_objective()
	_close_panel()


func _open_tape(chapter: int) -> void:
	tape_chapter = chapter
	tape_line = -1
	tape_paused = false
	tape_signal_time = 0.0
	tape_lock = 0.0
	tape_sound.stop()
	_show_screen(Screen.TAPE)


func _latest_tape_chapter() -> int:
	if stage >= Stage.FINAL_TAPE:
		return 6
	if stage >= Stage.PREPARATION_TAPE:
		return 5
	if stage >= Stage.INVITATION_TAPE:
		return 4
	if stage >= Stage.OFFERINGS_TAPE:
		return 3
	if stage >= Stage.RETURN_TO_TAPE:
		return 2
	return 1


func _play_tape() -> void:
	if tape_line == -2:
		return
	tape_line = -2
	tape_paused = false
	tape_lock = 0.0
	tape_elapsed = 0.0
	tape_sound.stream = TAPE_INSERT
	tape_sound.play()
	_update_tape_controls()


func _on_tape_sound_finished() -> void:
	if screen == Screen.TAPE and tape_line == -2 and not blackout:
		tape_sound.stream = TAPE_PLAY
		tape_sound.play()
		_next_tape_line()


func _tape_lines() -> Array:
	if tape_chapter == 1 and stage >= Stage.RETURN_TO_WELL:
		return StoryText.TAPE_ONE_REWATCH
	return TAPE_CHAPTERS[tape_chapter - 1]


func _next_tape_line(resuming := false) -> void:
	var lines := _tape_lines()
	if not resuming and tape_chapter == 6 and stage == Stage.FINAL_TAPE and CONFESSION_FLASHBACKS.has(tape_line):
		tape_sound.stop()
		_show_screen(CONFESSION_FLASHBACKS[tape_line])
		return
	tape_line = maxi(0, tape_line + 1)
	if tape_line < lines.size():
		var beat: Array = lines[tape_line]
		var original: String = beat[0]
		if tape_chapter == 6 and tape_line >= 2:
			%TapePicture.texture = TAPE_CRYING
		elif tape_chapter == 1 and (tape_line == StoryText.TAPE_GLANCE_BEAT or tape_line == StoryText.TAPE_ONE.size()):
			%TapePicture.texture = TAPE_GLANCE
		else:
			%TapePicture.texture = TAPE_FRAME
		_set_line(beat[1], "" if original.is_empty() else "Ah Ma", "", original)
		_set_action_label("")
		_default_focus().grab_focus()
	else:
		if tape_chapter == 1 and stage == Stage.WATCH_TAPE:
			stage = Stage.TAKE_INCENSE
		elif tape_chapter == 2 and stage == Stage.RETURN_TO_TAPE:
			stage = Stage.TAKE_PORTRAIT
		elif tape_chapter == 3 and stage == Stage.OFFERINGS_TAPE:
			stage = Stage.PREPARE_OFFERINGS
		elif tape_chapter == 4 and stage == Stage.INVITATION_TAPE:
			stage = Stage.TAKE_VESSEL
		elif tape_chapter == 5 and stage == Stage.PREPARATION_TAPE:
			stage = Stage.RETURN_TO_WELL
		elif tape_chapter == 6 and stage == Stage.FINAL_TAPE:
			stage = Stage.FINISHED
			_set_line("")
			_set_action_label("")
			tape_sound.stop()
			_show_screen(Screen.LISTEN)
			return
		_set_line("")
		_set_action_label("")
		tape_sound.stop()
		%TapeBack.grab_focus()
	_update_tape_controls()
	_update_tape_signal(0.0)
	if not tape_paused and turn_page.is_visible_in_tree():
		turn_page.grab_focus()


func _pause_tape() -> void:
	tape_paused = not tape_paused
	tape_sound.stream_paused = tape_paused
	if text_reveal and text_reveal.is_valid():
		if tape_paused:
			text_reveal.pause()
		else:
			text_reveal.play()
	_update_tape_controls()
	if not tape_paused and turn_page.is_visible_in_tree():
		turn_page.grab_focus()


func _update_tape_controls() -> void:
	var count := _tape_lines().size()
	var active := tape_line >= 0 and tape_line < count
	%TapeDeck.disabled = tape_line == -2
	var label := "Resume tape" if tape_paused else "Pause tape" if active else "Replay tape" if tape_line >= count else "Play tape"
	%DeckLabel.text = label
	%TapeDeck.accessibility_name = label
	var can_browse := not active and tape_line != -2
	%TapeEarlier.visible = can_browse and tape_chapter > 1
	%TapeEarlier.text = "‹ Chapter %d" % (tape_chapter - 1)
	%TapeLater.visible = can_browse and tape_chapter < _latest_tape_chapter()
	%TapeLater.text = "Chapter %d ›" % (tape_chapter + 1)
	%TapeStatus.text = ("LOAD" if tape_line == -2 else "PAUSE" if tape_paused else "PLAY" if active else "STOP")
	_update_tape_counter()
	%AdvanceBackdrop.visible = active and not tape_paused
	turn_page.visible = active and not tape_paused


func _use_tape_deck() -> void:
	if _tape_is_playing():
		_pause_tape()
	else:
		_play_tape()


func _tape_is_playing() -> bool:
	var count := _tape_lines().size()
	return tape_line >= 0 and tape_line < count


func _update_tape_signal(delta: float) -> void:
	var recording := _tape_is_playing()
	if recording and not tape_paused:
		var previous_second := floori(tape_elapsed)
		tape_elapsed += delta
		if floori(tape_elapsed) != previous_second:
			_update_tape_counter()
	tape_signal_time += delta
	var target := 1.0 if recording else 0.0
	tape_lock = move_toward(tape_lock, target, delta * 6.0)
	var material: ShaderMaterial = %TapePicture.material
	material.set_shader_parameter("scene_time", tape_signal_time)
	material.set_shader_parameter("signal_strength", tape_lock)
	material.set_shader_parameter("paused", tape_paused)


func _update_tape_counter() -> void:
	%TapeCounter.text = "CH %02d  %02d:%02d" % [
		tape_chapter, floori(tape_elapsed / 60.0), floori(tape_elapsed) % 60
	]


func _close_tape() -> void:
	tape_sound.stop()
	tape_paused = false
	tape_sound.stream_paused = false
	tape_sound.stream = TAPE_EJECT
	tape_sound.play()
	_show_screen(Screen.SITTING)


func _clear_hotspots() -> void:
	for hotspot in hotspots:
		hotspot.hide()
		hotspot.queue_free()
	hotspots.clear()
	labeled_hotspot = null
	hotspot_label.modulate.a = 0.0


func _update_hotspot_label(delta: float) -> void:
	var viewport := get_viewport()
	var target := (viewport.gui_get_focus_owner() if keyboard_navigation
		else viewport.gui_get_hovered_control()) as Button
	var active := target != null and target in hotspots
	var back_hover := active and target.accessibility_name == "Go back"
	%Objective.modulate.a = move_toward(%Objective.modulate.a, 0.0 if back_hover else 1.0, delta * 11.0)
	if active and target != labeled_hotspot:
		labeled_hotspot = target
		hotspot_label.text = target.accessibility_name
		hotspot_label.reset_size()
		%PlaceUnderline.visible = hotspot_label.text.begins_with("Place ")
		%PlaceUnderline.position = Vector2(9.0, hotspot_label.size.y - 2.0)
		%PlaceUnderline.size.x = hotspot_label.size.x - 18.0
		var area := target.get_rect()
		var width := hotspot_label.size.x
		var label_x := area.get_center().x
		match hotspot_label.text:
			"Place incense":
				label_x = 329.0
			"Place Grandpa’s portrait":
				label_x = 478.0
		hotspot_label.position.x = clampf(label_x - width * 0.5, 26.0, 1254.0 - width)
		var resting_y := area.end.y + 10.0 if area.end.y < 604.0 else area.position.y - 36.0
		match hotspot_label.text:
			"Go back":
				resting_y = 683.0
			"Look under the door":
				resting_y = area.position.y - 30.0
		hotspot_label.position.y = resting_y
	var speed := delta * 11.0
	hotspot_label.modulate.a = move_toward(hotspot_label.modulate.a, 1.0 if active else 0.0, speed)


func _set_inspection_zoom(point: Vector2, amount: float, immediate := false, closing := false) -> void:
	if inspection_tween:
		inspection_tween.kill()
	if amount > 0.0 or immediate:
		picture.set_shader_parameter("inspect_at", point)
	var blur := 1.0 if inspection_prop.visible and not closing else 0.0
	if immediate:
		picture.set_shader_parameter("inspect_zoom", amount)
		picture.set_shader_parameter("inspect_blur", blur)
		inspection_prop.modulate.a = 1.0
		if closing:
			inspection_prop.hide()
	else:
		inspection_tween = create_tween().set_parallel().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		inspection_tween.tween_property(picture, "shader_parameter/inspect_zoom", amount, 0.28)
		inspection_tween.tween_property(picture, "shader_parameter/inspect_blur", blur, 0.22)
		if inspection_prop.visible:
			if closing:
				inspection_tween.tween_property(inspection_prop, "modulate:a", 0.0, 0.20)
				inspection_tween.chain().tween_callback(inspection_prop.hide)
			else:
				inspection_prop.modulate.a = 0.0
				inspection_tween.tween_property(inspection_prop, "modulate:a", 1.0, 0.22)


func _show_panel(next: Overlay, opener: Control) -> void:
	overlay_opener = opener
	panel = next
	if inspection_tween and inspection_tween.is_running():
		inspection_tween.pause()
	if text_reveal and text_reveal.is_running():
		text_reveal.pause()
	opening_title.hide()
	story.hide()
	menu_signal.hide()
	if next == Overlay.INVENTORY:
		inventory.show()
		inventory.present(collected_items, held_item)
		return
	options_title.text = "Settings" if panel == Overlay.SETTINGS else "Paused"
	%Resume.text = "‹ Back" if panel == Overlay.SETTINGS else "Resume"
	%Resume.position.y = 422.0 if panel == Overlay.SETTINGS else 205.0
	%VolumeControls.position.y = 238.0 if panel == Overlay.SETTINGS else 275.0
	%ReturnToTitle.visible = panel == Overlay.PAUSE
	%ReplayInstruction.visible = panel == Overlay.PAUSE and stage >= Stage.TAKE_INCENSE
	%InstructionCaption.hide()
	%VolumeControls.show()
	if next == Overlay.PAUSE:
		_set_audio_paused(true)
	options.show()
	%Resume.grab_focus()


func _close_panel() -> void:
	var was_paused := panel in [Overlay.PAUSE, Overlay.INSTRUCTION]
	panel = Overlay.NONE
	options.hide()
	inventory.hide()
	opening_title.visible = screen == Screen.TITLE
	menu_signal.visible = screen == Screen.TITLE
	story.visible = screen != Screen.TITLE and not blackout
	if was_paused:
		_set_audio_paused(false)
	if inspection_tween and inspection_tween.is_valid():
		inspection_tween.play()
	if text_reveal and text_reveal.is_valid() and not (screen == Screen.TAPE and tape_paused):
		text_reveal.play()
	if is_instance_valid(overlay_opener) and overlay_opener.is_visible_in_tree():
		overlay_opener.grab_focus()
	else:
		_default_focus().grab_focus()
	overlay_opener = null


func _review_instruction() -> void:
	panel = Overlay.INSTRUCTION
	var chapter := _latest_tape_chapter()
	if stage in [Stage.RETURN_TO_TAPE, Stage.OFFERINGS_TAPE, Stage.INVITATION_TAPE, Stage.PREPARATION_TAPE, Stage.FINAL_TAPE]:
		chapter -= 1
	options_title.text = "Ah Ma’s last instruction"
	%InstructionCaption.text = StoryText.INSTRUCTIONS[chapter - 1]
	%InstructionCaption.show()
	%VolumeControls.hide()
	%ReturnToTitle.hide()
	%ReplayInstruction.hide()
	%Resume.position.y = 422.0
	%Resume.text = "‹ Back"
	%Resume.grab_focus()


func _set_audio_paused(paused: bool) -> void:
	if scare_sequence and scare_sequence.is_valid():
		if paused:
			scare_sequence.pause()
		else:
			scare_sequence.play()
	for player in audio_players:
		player.stream_paused = paused or (player == tape_sound and screen == Screen.TAPE and tape_paused)
	if audio_fade and audio_fade.is_valid():
		if paused:
			audio_fade.pause()
		else:
			audio_fade.play()


func _return_to_title() -> void:
	_close_panel()
	_show_screen(Screen.TITLE)


func _set_action_label(label: String) -> void:
	var transfer_focus := turn_page.has_focus() or action.has_focus()
	turn_page.visible = label.is_empty() and textbox.visible
	%AdvanceBackdrop.visible = turn_page.visible
	action.visible = not label.is_empty()
	if transfer_focus:
		_default_focus().grab_focus()
	action.text = "" if label.is_empty() else label + "  →"
	action.accessibility_name = label
	var font := action.get_theme_font("font")
	var width := font.get_string_size(action.text, HORIZONTAL_ALIGNMENT_LEFT, -1, action.get_theme_font_size("font_size")).x
	action.size.x = width + 28.0
	action.position.x = (1280.0 - action.size.x) * 0.5
	action_underline_width = width + 12.0


func _update_scene_choice(delta: float) -> void:
	var underline: ColorRect = %ActionMarker
	var active := action.visible and (action.is_hovered() or (keyboard_navigation and action.has_focus()))
	var speed := minf(delta * 10.0, 1.0)
	underline.modulate.a = move_toward(underline.modulate.a, 1.0 if active else 0.0, speed)
	underline.size.x = action_underline_width * lerpf(0.2, 1.0, underline.modulate.a)
	underline.position.x = action.position.x + (action.size.x - underline.size.x) * 0.5


func _default_focus() -> Button:
	if screen == Screen.TITLE:
		return %Begin
	if turn_page.is_visible_in_tree():
		return turn_page
	if screen == Screen.TAPE:
		return %TapeDeck if not %TapeDeck.disabled else %TapeBack
	return action if action.visible else %Pause
