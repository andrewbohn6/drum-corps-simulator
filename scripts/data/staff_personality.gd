class_name StaffPersonality
extends Resource

## Descriptive staff archetype. Gameplay modifiers can be added later without
## changing StaffMember or any staff UI.

@export var display_name: String = "Technical"
@export_multiline var description: String = "A detail-oriented teacher with a methodical approach."


static func create(name: String, personality_description: String) -> StaffPersonality:
	var personality := StaffPersonality.new()
	personality.display_name = name
	personality.description = personality_description
	return personality
