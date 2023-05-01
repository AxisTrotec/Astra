extends CanvasLayer


func set_build_preview(type, mouse_pos):
	var drag = load("res://Art Assets/Sketches/HQ.png")
	drag.set_name("Preview")
	drag = Color("ad54ffc")
	
	var control = Control.new()
	control.add_child(drag, true)
	control.rect_position = mouse_pos
	control.set_name("Preview")
	add_child(control, true)
	
