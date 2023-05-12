extends Node2D

@onready var cur_energy = $"Camera2D/CanvasLayer/Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"Camera2D/CanvasLayer/Counter Bar/CurrentOxygen"
@onready var cur_food = $"Camera2D/CanvasLayer/Counter Bar/CurrentFood"

@onready var facilities = $WorldGeneration/Facilities

#List of variables -----
var build_mode = false
var build_valid = false
var build_location
var build_type
var map_node

func _ready():
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
	
	map_node = get_node("WorldGeneration")
	for i in get_tree().get_nodes_in_group("facilities"):
		i.pressed.connect(initiate_build_mode.bind(i.get_text()))

func _process(delta):
	if build_mode:
		update_tower_preview()

func initiate_build_mode(type):
	build_type = type
	build_mode = true
	
	get_node("Build_preview").set_build_preview(type, get_global_mouse_position())

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	
	var color
	
	if Global.build_valid:
		color = "#30fc03"
	else:
		color = "#fc0313"
		
	get_node("Build_preview").update_tower_preview(mouse_position, color)
	
	build_valid = true
	build_location = mouse_position

func verify_and_build():
	if build_valid:
		var new_facility = load("res://Entities/HQ.tscn").instantiate()
		new_facility.position = build_location
		map_node.get_node("Facilities").add_child(new_facility, true)

func _on_timer_timeout() -> void:
	#Energy Rate
	Global.energy_current += 13
	cur_energy.text = str(Global.energy_current)
