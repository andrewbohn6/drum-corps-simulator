extends Control

const STAFF_SCENE := "res://scenes/staff/staff.tscn"

var member: StaffMember


func _ready() -> void:
	member = GameSession.selected_staff
	if member == null:
		SceneRouter.go_to(STAFF_SCENE)
		return
	%Portrait.configure(member.full_name, member.portrait_color)
	%NameLabel.text = member.full_name
	%CaptionLabel.text = member.primary_caption
	%AgeLabel.text = "Age %d  •  %d years experience" % [member.age, member.years_experience]
	%BiographyLabel.text = member.biography
	%EmployerValue.text = member.current_employer
	%PersonalityValue.text = member.personality.display_name
	%PersonalityDescription.text = member.personality.description
	%SalaryValue.text = "$%s / season" % _format_number(member.salary)
	%OverallValue.text = "%d" % member.get_overall_rating()
	_set_attribute(%TeachingBar, %TeachingValue, member.teaching_skill)
	_set_attribute(%DesignBar, %DesignValue, member.design_skill)
	_set_attribute(%LeadershipBar, %LeadershipValue, member.leadership)
	_set_attribute(%PotentialBar, %PotentialValue, member.potential)
	%HireButton.visible = GameSession.available_staff.has(member)
	%HireButton.disabled = GameSession.current_money < member.salary
	%HireButton.text = "Hire for $%s" % _format_number(member.salary)
	%AccentRule.color = GameSession.secondary_color
	CorpsStyle.apply_panel_outline(%ProfilePanel, GameSession.primary_color)
	CorpsStyle.apply_active_button(%HireButton, GameSession.primary_color)
	%BackButton.grab_focus()


func _set_attribute(bar: ProgressBar, value_label: Label, value: int) -> void:
	bar.value = value
	value_label.text = str(value)


func _format_number(value: int) -> String:
	var digits := str(value)
	var formatted := ""
	while digits.length() > 3:
		formatted = ",%s%s" % [digits.right(3), formatted]
		digits = digits.left(digits.length() - 3)
	return digits + formatted


func _on_hire_pressed() -> void:
	if GameSession.hire_staff(member):
		%HireButton.visible = false
		%StatusLabel.text = "%s is now your %s." % [member.full_name, member.primary_caption]
	else:
		%StatusLabel.text = "Unable to complete this hire. Return to the market and check your budget."


func _on_back_pressed() -> void:
	SceneRouter.go_to(STAFF_SCENE)
