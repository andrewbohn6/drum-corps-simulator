extends Control

const DASHBOARD_SCENE := "res://scenes/dashboard/dashboard.tscn"


func _ready() -> void:
	%ApprovalMessage.text = (
		"Your application has been approved.\n\n%s has officially joined the Drum Corps Association.\n\nYour first competitive season begins now."
		% GameSession.corps_name
	)
	%ProfileSummary.text = "$%s   •   %d members   •   %d staff   •   %s %d   •   ★☆☆☆☆" % [
		_format_number(GameSession.current_money),
		GameSession.current_members,
		GameSession.current_staff,
		GameSession.current_date,
		GameSession.current_season
	]
	%ContinueButton.grab_focus()


func _format_number(value: int) -> String:
	var digits := str(value)
	var formatted := ""
	while digits.length() > 3:
		formatted = ",%s%s" % [digits.right(3), formatted]
		digits = digits.left(digits.length() - 3)
	return digits + formatted


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file(DASHBOARD_SCENE)
