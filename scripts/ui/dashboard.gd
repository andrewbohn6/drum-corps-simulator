extends Control

const MAIN_MENU_SCENE := "res://scenes/main_menu/main_menu.tscn"
const STAFF_SCENE := "res://scenes/staff/staff.tscn"

const NEWS_ITEMS: Array[Dictionary] = [
	{"headline": "Welcome to the Drum Corps Association.", "category": "ORGANIZATION"},
	{"headline": "Begin hiring your instructional staff.", "category": "STAFF"},
	{"headline": "No members have been recruited.", "category": "RECRUITING"}
]


func _ready() -> void:
	%CorpsNameLabel.text = GameSession.corps_name
	%LocationLabel.text = "%s, %s" % [GameSession.home_city, GameSession.home_state]
	%PrimarySwatch.color = GameSession.primary_color
	%SecondarySwatch.color = GameSession.secondary_color
	%ReputationLabel.text = _reputation_stars(GameSession.corps_reputation)
	%DateLabel.text = GameSession.current_date.to_upper()
	%SeasonLabel.text = "SEASON %d" % GameSession.current_season
	%MoneyValue.text = "$%s" % _format_number(GameSession.current_money)
	%MembersValue.text = str(GameSession.current_members)
	%StaffValue.text = str(GameSession.current_staff)
	%ReputationValue.text = "%d STAR" % GameSession.corps_reputation
	%PhilosophyValue.text = GameSession.corps_philosophy
	CorpsStyle.apply_panel_outline(%IdentityPanel, GameSession.primary_color)
	CorpsStyle.apply_active_button(%StaffButton, GameSession.primary_color)
	%AccentRule.color = GameSession.secondary_color
	_populate_news_feed()
	%StaffButton.grab_focus()


func _populate_news_feed() -> void:
	for item: Dictionary in NEWS_ITEMS:
		var entry := VBoxContainer.new()
		entry.add_theme_constant_override("separation", 3)
		var category := Label.new()
		category.text = item["category"]
		category.add_theme_color_override("font_color", GameSession.secondary_color)
		category.add_theme_font_size_override("font_size", 12)
		var headline := Label.new()
		headline.text = item["headline"]
		headline.add_theme_font_size_override("font_size", 17)
		entry.add_child(category)
		entry.add_child(headline)
		%NewsList.add_child(entry)


func _reputation_stars(reputation: int) -> String:
	return "★".repeat(reputation) + "☆".repeat(5 - reputation)


func _format_number(value: int) -> String:
	var digits := str(value)
	var formatted := ""
	while digits.length() > 3:
		formatted = ",%s%s" % [digits.right(3), formatted]
		digits = digits.left(digits.length() - 3)
	return digits + formatted


func _on_staff_pressed() -> void:
	get_tree().change_scene_to_file(STAFF_SCENE)


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
