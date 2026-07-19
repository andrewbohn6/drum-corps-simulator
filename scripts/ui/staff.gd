extends Control

const DASHBOARD_SCENE := "res://scenes/dashboard/dashboard.tscn"


func _ready() -> void:
	%CorpsNameLabel.text = GameSession.corps_name
	%AccentRule.color = GameSession.secondary_color
	CorpsStyle.apply_panel_outline(%StaffPanel, GameSession.primary_color)
	CorpsStyle.apply_active_button(%HireStaffButton, GameSession.primary_color)
	%HireStaffButton.grab_focus()


func _on_hire_staff_pressed() -> void:
	%StatusLabel.text = "This feature arrives in Version 0.3."


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file(DASHBOARD_SCENE)
