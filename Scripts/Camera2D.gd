extends Camera2D

#Panels
@onready var panel = $"Counter Bar"

func _ready():
	#Set panels on top-left corner of the screen
	panel.set_position(Vector2(-18000,-10500))
	panel.scale.x = 20
	panel.scale.y = 20

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
			
			#Menu
			if Input.is_key_pressed(KEY_ESCAPE):
				get_tree().change_scene_to_file("res://Menus/WorldGenOptions/WGOptionsMenu.tscn")
