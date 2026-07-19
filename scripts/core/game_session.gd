extends Node

## Runtime-only state shared between scenes during an active game session.
## Persistence is deliberately represented by SaveData rather than scene nodes.

const DEFAULT_PRIMARY_COLOR := Color("#1f6feb")
const DEFAULT_SECONDARY_COLOR := Color("#f4b860")

var corps_name: String = "New Horizons"
var home_city: String = "Madison"
var home_state: String = "Wisconsin"
var primary_color: Color = DEFAULT_PRIMARY_COLOR
var secondary_color: Color = DEFAULT_SECONDARY_COLOR
var corps_reputation: int = 1
var current_money: int = 250_000
var current_members: int = 0
var current_staff: int = 0
var current_date: String = "January 1"
var current_season: int = 2026
var corps_philosophy: String = ""


func begin_corps_creation(
	new_corps_name: String,
	new_home_city: String,
	new_home_state: String,
	new_primary_color: Color,
	new_secondary_color: Color
) -> void:
	corps_name = new_corps_name.strip_edges()
	home_city = new_home_city.strip_edges()
	home_state = new_home_state.strip_edges()
	primary_color = new_primary_color
	secondary_color = new_secondary_color
	corps_philosophy = ""


## Completes founding and establishes the Version 0.2.0 starting profile.
func found_corps(philosophy: String) -> void:
	corps_philosophy = philosophy
	corps_reputation = 1
	current_money = 250_000
	current_members = 0
	current_staff = 0
	current_date = "January 1"
	current_season = 2026


## Produces a serialization-friendly snapshot without coupling runtime state to IO.
func create_save_data() -> SaveData:
	var data := SaveData.new()
	data.corps_name = corps_name
	data.home_city = home_city
	data.home_state = home_state
	data.primary_color = primary_color
	data.secondary_color = secondary_color
	data.corps_reputation = corps_reputation
	data.current_money = current_money
	data.current_members = current_members
	data.current_staff = current_staff
	data.current_date = current_date
	data.current_season = current_season
	data.corps_philosophy = corps_philosophy
	return data
