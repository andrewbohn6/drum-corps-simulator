extends Control

const NEW_GAME_SCENE := "res://scenes/new_game/new_game.tscn"
const STARTING_PROFILE_SCENE := "res://scenes/starting_profile/starting_profile.tscn"

const PHILOSOPHIES := {
	"Traditional Excellence": "Strong fundamentals.\nHigher judging confidence.\nSlower early growth.",
	"Entertainment First": "Crowd engagement.\nHigher attendance and fan support.\nSlightly lower judging confidence.",
	"Innovation": "Experimental design.\nHigher design ceiling.\nRiskier competitive results.",
	"Education": "Member-focused culture.\nBetter retention and easier recruiting.\nLess competitive early."
}

var selected_philosophy: String = ""


func _ready() -> void:
	var group := ButtonGroup.new()
	var cards: Dictionary = {
		"Traditional Excellence": %TraditionalExcellenceCard,
		"Entertainment First": %EntertainmentFirstCard,
		"Innovation": %InnovationCard,
		"Education": %EducationCard
	}
	for philosophy_name: String in cards:
		var button := cards[philosophy_name] as Button
		button.text = "%s\n\n%s" % [philosophy_name, PHILOSOPHIES[philosophy_name]]
		button.button_group = group
		button.pressed.connect(_on_philosophy_selected.bind(philosophy_name))
	%TraditionalExcellenceCard.grab_focus()


func _on_philosophy_selected(philosophy_name: String) -> void:
	selected_philosophy = philosophy_name
	%SelectionLabel.text = "%s will define your organization." % philosophy_name
	%ContinueButton.disabled = false


func _on_continue_pressed() -> void:
	if selected_philosophy.is_empty():
		return
	GameSession.found_corps(selected_philosophy)
	SceneRouter.go_to(STARTING_PROFILE_SCENE)


func _on_back_pressed() -> void:
	SceneRouter.go_to(NEW_GAME_SCENE)
