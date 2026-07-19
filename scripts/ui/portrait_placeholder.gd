extends Control

## Generated silhouette used until portrait assets are introduced.

var portrait_color := Color("#3b668c")
var initials := "DS"


func configure(full_name: String, color: Color) -> void:
	portrait_color = color
	var names := full_name.split(" ", false)
	initials = names[0].left(1)
	if names.size() > 1:
		initials += names[-1].left(1)
	queue_redraw()


func _draw() -> void:
	var center := size * 0.5
	draw_rect(Rect2(Vector2.ZERO, size), portrait_color.darkened(0.42), true)
	draw_circle(Vector2(center.x, size.y * 0.34), size.x * 0.18, portrait_color.lightened(0.22))
	draw_circle(Vector2(center.x, size.y * 0.88), size.x * 0.36, portrait_color)
	var font := ThemeDB.fallback_font
	var font_size := maxi(12, int(size.x * 0.16))
	var text_size := font.get_string_size(initials, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size)
	draw_string(font, Vector2(center.x - text_size.x * 0.5, size.y - 8), initials, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, Color(1, 1, 1, 0.88))
