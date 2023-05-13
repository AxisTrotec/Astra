extends Camera2D

var zoomSpeed = 0.05

func _input(event):
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
			
			#Menus
			if Input.is_key_pressed(KEY_ESCAPE):
				get_tree().change_scene_to_file("res://Menus/WorldGenOptions/WGOptionsMenu.tscn")
				
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
			zoom.x += zoomSpeed
			zoom.y += zoomSpeed
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
			zoom.x -= zoomSpeed
			zoom.y -= zoomSpeed


