extends Node

## Lightweight cross-scene state for the corps setup flow.
## Simulation state belongs in dedicated systems in a later release.

const DEFAULT_PRIMARY_COLOR := Color("#1f6feb")
const DEFAULT_SECONDARY_COLOR := Color("#f4b860")

var corps_name: String = "New Horizons"
var home_city: String = "Madison"
var home_state: String = "Wisconsin"
var primary_color: Color = DEFAULT_PRIMARY_COLOR
var secondary_color: Color = DEFAULT_SECONDARY_COLOR


func create_corps(
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

