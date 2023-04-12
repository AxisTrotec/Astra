extends Camera2D

@onready var cur_energy = $"Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"Counter Bar/CurrentOxygen"
@onready var cur_food = $"Counter Bar/CurrentFood"

#Panels
@onready var panel = $"Counter Bar"
@onready var FacilitiesPanel = $"Facilities Panel"

func _ready():
	#Set panels on top-left corner of the screen
	panel.set_position(Vector2(-18000,-10500))
	panel.scale.x = 20
	panel.scale.y = 20
	
	FacilitiesPanel.set_position(Vector2(-18000,-10500))
	FacilitiesPanel.scale.x = 20
	FacilitiesPanel.scale.y = 20
	
	#Set counter variables
	cur_energy.text = str(Global.energy_current)
	cur_oxygen.text = str(Global.oxygen_current)
	cur_food.text = str(Global.food_current)
	
	#Timer for counter updates with rates
	var timer := Timer.new()
	add_child(timer)
	
	#60 seconds
	timer.wait_time = 60
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
func _on_timer_timeout() -> void:
	#Energy Rate
	Global.energy_current += 13
	cur_energy.text = str(Global.energy_current)

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
