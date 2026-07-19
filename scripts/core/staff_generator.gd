class_name StaffGenerator
extends RefCounted

## Procedural staff market generator. Archetypes deliberately create a wide
## range from raw prospects and hidden gems to expensive legendary educators.

const POSITIONS: Array[String] = [
	"Corps Director", "Brass Caption Head", "Percussion Caption Head",
	"Visual Caption Head", "Color Guard Caption Head", "Assistant Brass",
	"Assistant Percussion", "Assistant Visual", "Assistant Guard"
]

const FIRST_NAMES: Array[String] = [
	"Emily", "Michael", "Avery", "Jordan", "Elena", "Marcus", "Talia", "Noah",
	"Priya", "Gabriel", "Renee", "Darius", "Sofia", "Caleb", "Morgan", "Luis",
	"Naomi", "Theo", "Jasmine", "Grant", "Maya", "Andre", "Leah", "Elliot"
]
const LAST_NAMES: Array[String] = [
	"Carter", "Flores", "Bennett", "Kim", "Ramirez", "Sullivan", "Okafor", "Patel",
	"Hughes", "Morales", "Chen", "Brooks", "Reed", "Thompson", "Nguyen", "Foster",
	"Collins", "Rivera", "Bailey", "Ward", "Price", "Bell", "Cooper", "Diaz"
]
const EMPLOYERS: Array[String] = [
	"Independent educator", "Lakeview High School", "Metro Arts Academy",
	"Northern State University", "Summit Performing Arts", "Freelance designer",
	"River City Indoor", "Westfield Conservatory", "Crescent Sound", "Retired"
]
const PERSONALITIES := {
	"Demanding": "Sets exacting standards and expects complete preparation.",
	"Inspirational": "Builds belief and draws exceptional effort from a team.",
	"Technical": "Approaches every rehearsal through precise, repeatable systems.",
	"Creative": "Finds expressive solutions and encourages artistic exploration.",
	"Veteran": "Brings composure, perspective, and years of institutional knowledge.",
	"Player's Coach": "Earns trust through empathy and direct member advocacy.",
	"Visionary": "Sees ambitious possibilities before others recognize them.",
	"Strict": "Maintains firm structure, clear rules, and consistent accountability."
}
const PORTRAIT_COLORS: Array[Color] = [
	Color("#2f5d7c"), Color("#6c4f7c"), Color("#3f6f62"), Color("#7a5542"),
	Color("#40568a"), Color("#7c3f57"), Color("#526b3f"), Color("#715b32")
]


static func generate_market(count: int = 15) -> Array[StaffMember]:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	var market: Array[StaffMember] = []
	var used_names: Dictionary = {}
	for index in count:
		var member := _generate_member(rng, index)
		while used_names.has(member.full_name):
			member.full_name = "%s %s" % [FIRST_NAMES.pick_random(), LAST_NAMES.pick_random()]
		used_names[member.full_name] = true
		market.append(member)
	return market


static func _generate_member(rng: RandomNumberGenerator, index: int) -> StaffMember:
	var member := StaffMember.new()
	member.staff_id = "%d-%d" % [int(Time.get_unix_time_from_system()), index]
	member.full_name = "%s %s" % [FIRST_NAMES[rng.randi_range(0, FIRST_NAMES.size() - 1)], LAST_NAMES[rng.randi_range(0, LAST_NAMES.size() - 1)]]
	member.primary_caption = POSITIONS[rng.randi_range(0, POSITIONS.size() - 1)]
	member.current_employer = EMPLOYERS[rng.randi_range(0, EMPLOYERS.size() - 1)]
	member.portrait_color = PORTRAIT_COLORS[rng.randi_range(0, PORTRAIT_COLORS.size() - 1)]
	var personality_names := PERSONALITIES.keys()
	var personality_name: String = personality_names[rng.randi_range(0, personality_names.size() - 1)]
	member.personality = StaffPersonality.create(personality_name, PERSONALITIES[personality_name])

	# Weighted archetypes prevent a market full of interchangeable candidates.
	var archetype_roll := rng.randf()
	if archetype_roll < 0.18:
		_apply_legendary_profile(member, rng)
	elif archetype_roll < 0.42:
		_apply_young_profile(member, rng)
	elif archetype_roll < 0.62:
		_apply_hidden_gem_profile(member, rng)
	else:
		_apply_established_profile(member, rng)
	member.biography = _build_biography(member)
	return member


static func _apply_legendary_profile(member: StaffMember, rng: RandomNumberGenerator) -> void:
	member.age = rng.randi_range(48, 67)
	member.years_experience = rng.randi_range(24, member.age - 22)
	member.experience = rng.randi_range(86, 99)
	member.teaching_skill = rng.randi_range(78, 97)
	member.design_skill = rng.randi_range(76, 98)
	member.leadership = rng.randi_range(82, 99)
	member.potential = rng.randi_range(82, 96)
	member.loyalty = rng.randi_range(55, 90)
	member.salary = rng.randi_range(78, 125) * 1000


static func _apply_young_profile(member: StaffMember, rng: RandomNumberGenerator) -> void:
	member.age = rng.randi_range(23, 31)
	member.years_experience = rng.randi_range(1, maxi(2, member.age - 22))
	member.experience = rng.randi_range(28, 52)
	member.teaching_skill = rng.randi_range(48, 74)
	member.design_skill = rng.randi_range(48, 78)
	member.leadership = rng.randi_range(38, 68)
	member.potential = rng.randi_range(75, 96)
	member.loyalty = rng.randi_range(58, 92)
	member.salary = rng.randi_range(22, 42) * 1000


static func _apply_hidden_gem_profile(member: StaffMember, rng: RandomNumberGenerator) -> void:
	member.age = rng.randi_range(27, 43)
	member.years_experience = rng.randi_range(5, member.age - 22)
	member.experience = rng.randi_range(48, 70)
	member.teaching_skill = rng.randi_range(72, 90)
	member.design_skill = rng.randi_range(68, 91)
	member.leadership = rng.randi_range(60, 84)
	member.potential = rng.randi_range(82, 98)
	member.loyalty = rng.randi_range(65, 94)
	member.salary = rng.randi_range(32, 58) * 1000


static func _apply_established_profile(member: StaffMember, rng: RandomNumberGenerator) -> void:
	member.age = rng.randi_range(32, 52)
	member.years_experience = rng.randi_range(9, member.age - 22)
	member.experience = rng.randi_range(60, 84)
	member.teaching_skill = rng.randi_range(62, 86)
	member.design_skill = rng.randi_range(58, 88)
	member.leadership = rng.randi_range(62, 88)
	member.potential = rng.randi_range(68, 90)
	member.loyalty = rng.randi_range(45, 85)
	member.salary = rng.randi_range(48, 79) * 1000


static func _build_biography(member: StaffMember) -> String:
	return "%s is a %s specialist with %d years of experience. Known as a %s educator, %s brings a distinctive approach to ensemble development." % [
		member.full_name,
		member.primary_caption,
		member.years_experience,
		member.personality.display_name.to_lower(),
		member.full_name.get_slice(" ", 0)
	]
