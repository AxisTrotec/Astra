extends CanvasLayer

var preloadSprite = preload("res://Entities/HQ.tscn")

func set_build_preview(type, mouse_pos):
	var facility = preloadSprite.instantiate()
	
	get_child(0).position = Vector2(mouse_pos.x, mouse_pos.y)
	
#	facility.set_name("DragPreview")
##	drag.modulate = Color("54ffc")
#
#	var control = Control.new()
#	control.add_child(facility, true)
#	control.position = mouse_pos
#	control.set_name("Preview")
#	add_child(control, true)
#	move_child(get_node("Preview"), 0)
	
func update_tower_preview(new_pos, color):
	pass
#	if get_node("Preview/DragPreview").modulate != Color(color):
#		get_node("Preview/DragPreview").modulate = Color(color)
