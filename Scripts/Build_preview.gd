extends CanvasLayer


func set_build_preview(mouse_pos, type):
	#var preloadSprite = load("res://Entities/" + type + ".tscn")
	#var preloadSprite = load("res://Entities/HQ.tscn")
	var preloadSprite = load("res://Scenes/Test.tscn")
	var facility = preloadSprite.instantiate()
	facility.set_name("DragPreview")
	facility.position = mouse_pos
	add_child(facility)

func update_tower_preview(new_pos, color):
	if Global.build_init:
		get_node("DragPreview").position = Global.build_pos
	else:
		get_node("DragPreview").position = Vector2(ceil(new_pos.x),ceil(new_pos.y))

	if get_node("DragPreview").modulate != Color(color):
		get_node("DragPreview").modulate = Color(color)
