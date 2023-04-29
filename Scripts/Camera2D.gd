extends Camera2D

#Panels
@onready var panel = $"Counter Bar"
@onready var buildPanel = $"MainPanel"

var buildPanelFlag = false

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
			
			if Input.is_key_pressed(KEY_CTRL):
				build_panel()
			
			#Menu
			if Input.is_key_pressed(KEY_ESCAPE):
				get_tree().change_scene_to_file("res://Menus/WorldGenOptions/WGOptionsMenu.tscn")
				
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
#				if buildPanelFlag:
#					buildPanel.visible = false

func build_panel():
	buildPanelFlag = true
	buildPanel.set_position(Vector2(get_global_mouse_position().x, get_global_mouse_position().y))
	buildPanel.scale.x = 20
	buildPanel.scale.y = 20
	buildPanel.visible = true
