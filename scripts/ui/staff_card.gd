extends PanelContainer

signal profile_requested(member: StaffMember)
signal hire_requested(member: StaffMember)

var staff_member: StaffMember


func setup(member: StaffMember, is_hired: bool = false) -> void:
	staff_member = member
	%Portrait.configure(member.full_name, member.portrait_color)
	%NameLabel.text = member.full_name
	%CaptionLabel.text = member.primary_caption
	%EmployerLabel.text = member.current_employer
	%RatingLabel.text = "%d OVR" % member.get_overall_rating()
	%SalaryLabel.text = "$%s / season" % _format_number(member.salary)
	%BiographyLabel.text = member.biography
	%HireButton.visible = not is_hired
	%ProfileButton.text = "View Profile"


func _format_number(value: int) -> String:
	var digits := str(value)
	var formatted := ""
	while digits.length() > 3:
		formatted = ",%s%s" % [digits.right(3), formatted]
		digits = digits.left(digits.length() - 3)
	return digits + formatted


func _on_profile_pressed() -> void:
	profile_requested.emit(staff_member)


func _on_hire_pressed() -> void:
	hire_requested.emit(staff_member)
