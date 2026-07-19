extends CanvasLayer

## Global scene transition service. It blocks input during a short professional
## fade and keeps navigation behavior consistent across every screen.

var overlay: ColorRect
var is_transitioning := false


func _ready() -> void:
	layer = 100
	overlay = ColorRect.new()
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.color = Color(0.027, 0.043, 0.071, 0.0)
	overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(overlay)


func go_to(scene_path: String) -> void:
	if is_transitioning:
		return
	is_transitioning = true
	overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	var fade_out := create_tween()
	fade_out.tween_property(overlay, "color:a", 1.0, 0.18)
	await fade_out.finished
	get_tree().change_scene_to_file(scene_path)
	var fade_in := create_tween()
	fade_in.tween_property(overlay, "color:a", 0.0, 0.22)
	await fade_in.finished
	overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	is_transitioning = false
