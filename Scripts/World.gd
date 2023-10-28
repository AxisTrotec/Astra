extends Node2D

@onready var cur_energy = $"DescPanels/CanvasLayer/Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"DescPanels/CanvasLayer/Counter Bar/CurrentOxygen"
@onready var cur_food = $"DescPanels/CanvasLayer/Counter Bar/CurrentFood"

@onready var facilities = $WorldGeneration/Facilities

#List of variables -----
var build_mode = false
var build_location
var build_type
var map_node

func _ready():
	for i in get_tree().get_nodes_in_group("facilities"):
		i.connect("pressed",Callable(self,"initiate_build_mode").bind(i.get_name()))

	if Global.new_game:
		#Set energy to the default
		Global.energy_current += 500

#		#Set food to the default
		Global.food_current += 500

#		#Set food to the default
		Global.oxygen_current += 500

	
	#Set counter variables
	cur_energy.text = str(Global.energy_current) + "(+" + str(Global.energy_rate) + ")"
	cur_oxygen.text = str(Global.oxygen_current) + "(+" + str(Global.oxygen_rate) + ")"
	cur_food.text = str(Global.food_current) + "(+" + str(Global.food_rate) + ")"
	
	#Timer for counter updates with rates
	var timer := Timer.new()
	add_child(timer)
	
	#60 seconds
	timer.wait_time = 60
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
	map_node = get_node("WorldGeneration")

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			verify_and_build()

func _process(delta):
	if build_mode:
		update_tower_preview()

func initiate_build_mode(type):
	build_type = type
	build_mode = true
	Global.build_mode = true
	
	get_node("Build_preview").set_build_preview(get_global_mouse_position(), type)

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	
	var color = "#30fc03"
	
	if Global.build_valid:
		color = "#30fc03"
	else:
		color = "#fc0313"
		
	get_node("Build_preview").update_tower_preview(mouse_position, color)
	build_location = mouse_position
	
func verify_and_build():
	if Global.build_valid and build_mode:
		#var new_facility = load("res://Entities/HQ.tscn").instantiate()
		var new_facility = load("res://Scenes/Test.tscn").instantiate()
		new_facility.position = build_location
		map_node.get_node("Facilities").add_child(new_facility, true)
		update_counter()

func update_counter():
	cur_energy.text = str(Global.energy_current) + "(+" + str(Global.energy_rate) + ")"
	cur_oxygen.text = str(Global.oxygen_current) + "(+" + str(Global.oxygen_rate) + ")"
	cur_food.text = str(Global.food_current) + "(+" + str(Global.food_rate) + ")"

func _on_timer_timeout() -> void:
	#Energy Rate
	Global.energy_current += 13
	cur_energy.text = str(Global.energy_current)
