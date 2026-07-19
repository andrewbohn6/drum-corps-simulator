extends Control

const DASHBOARD_SCENE := "res://scenes/dashboard/dashboard.tscn"
const PROFILE_SCENE := "res://scenes/staff_profile/staff_profile.tscn"
const STAFF_CARD := preload("res://scenes/components/staff_card.tscn")


func _ready() -> void:
	GameSession.ensure_staff_market()
	%CorpsNameLabel.text = GameSession.corps_name
	%BudgetLabel.text = "Available Budget  •  $%s" % _format_number(GameSession.current_money)
	%AccentRule.color = GameSession.secondary_color
	CorpsStyle.apply_panel_outline(%StaffPanel, GameSession.primary_color)
	_populate_staff_lists()
	%ReturnButton.grab_focus()


func _populate_staff_lists() -> void:
	_clear_list(%MyStaffList)
	_clear_list(%MarketList)
	%EmptyStaffLabel.visible = GameSession.hired_staff.is_empty()
	for member: StaffMember in GameSession.hired_staff:
		%MyStaffList.add_child(_create_card(member, true))
	for member: StaffMember in GameSession.available_staff:
		%MarketList.add_child(_create_card(member, false))


func _create_card(member: StaffMember, is_hired: bool) -> Control:
	var card := STAFF_CARD.instantiate()
	card.setup(member, is_hired)
	card.profile_requested.connect(_on_profile_requested)
	card.hire_requested.connect(_on_hire_requested)
	return card


func _clear_list(list: Container) -> void:
	for child in list.get_children():
		child.queue_free()


func _on_profile_requested(member: StaffMember) -> void:
	GameSession.select_staff(member)
	SceneRouter.go_to(PROFILE_SCENE)


func _on_hire_requested(member: StaffMember) -> void:
	if GameSession.hire_staff(member):
		%StatusLabel.text = "%s has joined your corps." % member.full_name
		%BudgetLabel.text = "Available Budget  •  $%s" % _format_number(GameSession.current_money)
		_populate_staff_lists()
	else:
		%StatusLabel.text = "This hire could not be completed. Check your available budget."


func _format_number(value: int) -> String:
	var digits := str(value)
	var formatted := ""
	while digits.length() > 3:
		formatted = ",%s%s" % [digits.right(3), formatted]
		digits = digits.left(digits.length() - 3)
	return digits + formatted


func _on_return_pressed() -> void:
	SceneRouter.go_to(DASHBOARD_SCENE)
