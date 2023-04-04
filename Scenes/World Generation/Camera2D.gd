extends Camera2D

#var zoomSpd = 100
#var zoomMargin = .3
#
#var zoomMin = 0.2
#var zoomMax = 1
#
#var zoompos = Vector2()
#var zoomfactor = 1.0

#func _process(delta):
#	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomSpd * delta)
#	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomSpd * delta)
#
#	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
#	zoom.y = clamp(zoom.y, zoomMin, zoomMax)

func _input(event):
#	var velocity = Vector2()
#
#	if abs(zoompos.x - get_global_mouse_position().x) > zoomMargin:
#		zoomfactor = 1.0
#	if abs(zoompos.y - get_global_mouse_position().x) > zoomMargin:
#		zoomfactor = 1.0
#
	if event is InputEventKey:
		if event.is_pressed():
			#Movements
			if Input.is_key_pressed(KEY_LEFT):
				position.x -= 50
			if Input.is_key_pressed(KEY_UP):
				position.y -= 50
			if Input.is_key_pressed(KEY_RIGHT):
				position.x += 50
			if Input.is_key_pressed(KEY_DOWN):
				position.y += 50
			
			#Menu
			if Input.is_key_pressed(KEY_ESCAPE):
				get_tree().change_scene_to_file("res://Menus/WorldGenOptions/WGOptionsMenu.tscn")