extends PanelContainer

@onready var cur_energy = $"Counter Bar/CurrentEnergy"
@onready var cur_oxygen = $"Counter Bar/CurrentOxygen"
@onready var cur_food = $"Counter Bar/CurrentFood"

func _ready():
	print(DisplayServer.screen_get_size())
	$PanelContainer.position = Vector2(-500,-500)
	
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
	print(Global.energy_current)
	cur_energy.text = str(Global.energy_current)
	print("test")
	print(Global.energy_current)
	print(Global.energy_rate)
	print(Global.energy_max)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
