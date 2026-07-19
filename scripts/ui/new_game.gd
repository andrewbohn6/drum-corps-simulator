extends Control

const MAIN_MENU_SCENE := "res://scenes/main_menu/main_menu.tscn"
const PHILOSOPHY_SCENE := "res://scenes/founding_philosophy/founding_philosophy.tscn"

@onready var corps_name_field: LineEdit = %CorpsNameField
@onready var home_city_field: LineEdit = %HomeCityField
@onready var home_state_field: LineEdit = %HomeStateField
@onready var primary_color_picker: ColorPickerButton = %PrimaryColorPicker
@onready var secondary_color_picker: ColorPickerButton = %SecondaryColorPicker
@onready var validation_label: Label = %ValidationLabel


func _ready() -> void:
	primary_color_picker.color = GameSession.DEFAULT_PRIMARY_COLOR
	secondary_color_picker.color = GameSession.DEFAULT_SECONDARY_COLOR
	corps_name_field.grab_focus()


func _on_create_corps_pressed() -> void:
	var missing_fields: Array[String] = []
	if corps_name_field.text.strip_edges().is_empty():
		missing_fields.append("corps name")
	if home_city_field.text.strip_edges().is_empty():
		missing_fields.append("home city")
	if home_state_field.text.strip_edges().is_empty():
		missing_fields.append("home state")

	if not missing_fields.is_empty():
		validation_label.text = "Please enter your %s." % ", ".join(missing_fields)
		return

	GameSession.begin_corps_creation(
		corps_name_field.text,
		home_city_field.text,
		home_state_field.text,
		primary_color_picker.color,
		secondary_color_picker.color
	)
	get_tree().change_scene_to_file(PHILOSOPHY_SCENE)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
