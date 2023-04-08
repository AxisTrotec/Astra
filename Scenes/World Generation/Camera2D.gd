extends Camera2D

@onready var cur_energy = $"Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"Counter Bar/CurrentOxygen"
@onready var cur_food = $"Counter Bar/CurrentFood"

@onready var panel = $"Counter Bar"

func _ready():
	print(DisplayServer.screen_get_dpi())
	panel.set_position(Vector2(-18000,-10500))
	panel.scale.x = 40
	panel.scale.y = 40
	print(panel.get_screen_position())
	
	#Set counter variables
	cur_energy.text = str(Global.energy_current)
	cur_oxygen.text = str(Global.oxygen_current)
	cur_food.text = str(Global.food_current)
	
	#Timer for counter updates with rates
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 10
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
		
func _on_timer_timeout() -> void:
	Global.energy_current += 13
	cur_energy.text = str(Global.energy_current)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
