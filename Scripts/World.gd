extends Node2D

@onready var cur_energy = $"Camera2D/Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"Camera2D/Counter Bar/CurrentOxygen"
@onready var cur_food = $"Camera2D/Counter Bar/CurrentFood"

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
	
func _on_timer_timeout() -> void:
	#Energy Rate
	Global.energy_current += 13
	cur_energy.text = str(Global.energy_current)
