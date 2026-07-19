class_name StaffMember
extends Resource

## Serializable staff record used by both the market and hired-staff systems.

@export var staff_id: String = ""
@export var full_name: String = ""
@export var age: int = 30
@export var primary_caption: String = "Assistant Visual"
@export var experience: int = 50
@export var teaching_skill: int = 50
@export var design_skill: int = 50
@export var leadership: int = 50
@export var salary: int = 35_000
@export var personality: StaffPersonality
@export_multiline var biography: String = ""
@export var portrait_color: Color = Color("#3b668c")
@export var current_employer: String = "Independent educator"
@export var loyalty: int = 50
@export var potential: int = 65
@export var years_experience: int = 8


## Overall emphasizes teaching while still rewarding design, leadership, and
## proven experience. It is always derived rather than stored.
func get_overall_rating() -> int:
	var weighted := (
		teaching_skill * 0.38
		+ design_skill * 0.25
		+ leadership * 0.22
		+ experience * 0.15
	)
	return clampi(roundi(weighted), 0, 100)
