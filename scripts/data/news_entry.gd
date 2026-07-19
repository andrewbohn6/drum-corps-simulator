class_name NewsEntry
extends Resource

## Reusable news record for staff, recruiting, competition, and future systems.

@export var title: String = ""
@export_multiline var body: String = ""
@export var category: String = "ORGANIZATION"
@export var date: String = "January 1"


static func create(entry_title: String, entry_body: String, entry_category: String, entry_date: String) -> NewsEntry:
	var entry := NewsEntry.new()
	entry.title = entry_title
	entry.body = entry_body
	entry.category = entry_category
	entry.date = entry_date
	return entry
