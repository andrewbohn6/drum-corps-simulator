class_name CorpsStyle
extends RefCounted

## Small runtime styling helpers that introduce corps colors without replacing
## the shared professional dark theme.


static func apply_panel_outline(panel: PanelContainer, color: Color) -> void:
	var base_style := panel.get_theme_stylebox("panel")
	if base_style is not StyleBoxFlat:
		return
	var style := base_style.duplicate() as StyleBoxFlat
	style.border_color = color
	panel.add_theme_stylebox_override("panel", style)


static func apply_active_button(button: Button, color: Color) -> void:
	var base_style := button.get_theme_stylebox("normal")
	if base_style is not StyleBoxFlat:
		return
	var style := base_style.duplicate() as StyleBoxFlat
	style.border_color = color
	style.border_width_left = 2
	button.add_theme_stylebox_override("normal", style)
