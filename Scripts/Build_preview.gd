extends TileMap

var preloadSprite = preload("res://Entities/HQ.tscn")

func set_build_preview(type, mouse_pos):
	var facility = preloadSprite.instantiate()
	
#	facility.set_name("DragPreview")
#	drag.modulate = Color("54ffc")
	
	var area2d = Area2D.new()
	area2d.add_child(facility, true)
	area2d.set_name("Preview")
	add_child(area2d)
	get_node("Preview").position = mouse_pos
	print(get_node("Preview").position)
	move_child(get_node("Preview"), 0)
	
func update_tower_preview(new_pos, color):
	pass
#	if get_node("Preview/DragPreview").modulate != Color(color):
#		get_node("Preview/DragPreview").modulate = Color(color)
