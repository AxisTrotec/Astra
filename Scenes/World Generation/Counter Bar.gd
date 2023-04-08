extends HBoxContainer


func _ready():
	#Timer for counter updates with rates
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
		
func _on_timer_timeout() -> void:
	#energy_current += 13
	print("test")
	print(Global.energy_current)
	print(Global.energy_rate)
	print(Global.energy_max)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.new_game:
		$CurrentEnergy.text = "the text"
