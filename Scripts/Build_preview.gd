extends CanvasLayer


func set_build_preview(type, mouse_pos):
	var drag = load("res://Art Assets/Sketches/HQ.png")
	drag.set_name("DragPreview")
	drag.modulate = Color("ad54ffc")
	
	var control = Control.new()
	control.add_child(drag, true)
	control.rect_position = mouse_pos
	control.set_name("Preview")
	add_child(control, true)
	#move_child(get_node("Preview"), 0)

func update_tower_preview(new_pos, color):
	get_node("Preview").rect_position = new_pos
	if get_node("Preview/DragPreview").modulate != Color(color):
		get_node("Preview/DragPreview").modulate = Color(color)
