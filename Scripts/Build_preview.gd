extends CanvasLayer


func set_build_preview(type, mouse_pos):
	var drag = load("res://Entities/HQ.tscn").instantiate()
	drag.set_name("DragPreview")
#	drag.modulate = Color("54ffc")

	var control = Control.new()
	control.add_child(drag, true)
	control.position = mouse_pos
	control.set_name("Preview")
	add_child(control, true)
	move_child(get_node("Preview"), 0)

func update_tower_preview(new_pos, color):
	get_node("Preview").position = new_pos
#	if get_node("Preview/DragPreview").modulate != Color(color):
#		get_node("Preview/DragPreview").modulate = Color(color)
