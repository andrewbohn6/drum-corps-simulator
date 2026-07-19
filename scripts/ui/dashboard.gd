extends Control

const MAIN_MENU_SCENE := "res://scenes/main_menu/main_menu.tscn"


func _ready() -> void:
	%CorpsNameLabel.text = GameSession.corps_name
	%LocationLabel.text = "%s, %s" % [GameSession.home_city, GameSession.home_state]
	%PrimarySwatch.color = GameSession.primary_color
	%SecondarySwatch.color = GameSession.secondary_color
	%RecruitingButton.grab_focus()


func _on_section_pressed(section_name: String) -> void:
	%StatusLabel.text = "%s management is planned for a future update." % section_name


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)

