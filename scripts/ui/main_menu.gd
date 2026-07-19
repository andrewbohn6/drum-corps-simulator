extends Control

const NEW_GAME_SCENE := "res://scenes/new_game/new_game.tscn"

@onready var new_game_button: Button = %NewGameButton


func _ready() -> void:
	new_game_button.grab_focus()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file(NEW_GAME_SCENE)


func _on_load_game_pressed() -> void:
	_show_coming_soon("Save management arrives in a future update.")


func _on_settings_pressed() -> void:
	_show_coming_soon("Settings arrive in a future update.")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _show_coming_soon(message: String) -> void:
	%StatusLabel.text = message

