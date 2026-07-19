class_name SaveData
extends Resource

## Serializable representation of career progress.
## Version 0.3 can persist this resource without restructuring runtime state.

@export var corps_name: String = ""
@export var home_city: String = ""
@export var home_state: String = ""
@export var primary_color: Color = Color.WHITE
@export var secondary_color: Color = Color.WHITE
@export var corps_reputation: int = 1
@export var current_money: int = 250_000
@export var current_members: int = 0
@export var current_staff: int = 0
@export var current_date: String = "January 1"
@export var current_season: int = 2026
@export var corps_philosophy: String = ""
@export var available_staff: Array[StaffMember] = []
@export var hired_staff: Array[StaffMember] = []
@export var news_entries: Array[NewsEntry] = []
