extends CanvasLayer

var preloadSprite = preload("res://Entities/HQ.tscn")

func set_build_preview(type, mouse_pos):
	var facility = preloadSprite.instantiate()
	facility.set_name("DragPreview")
	facility.position = mouse_pos
	add_child(facility)

func update_tower_preview(new_pos, color):
	get_node("DragPreview").position = Vector2(ceil(new_pos.x),ceil(new_pos.y))
	
	if get_node("DragPreview").modulate != Color(color):
		get_node("DragPreview").modulate = Color(color)
