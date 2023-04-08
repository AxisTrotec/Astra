extends PanelContainer

func _ready():
	#print(DisplayServer.screen_get_size())
	#position = Vector2(-2560, -1440)
	
	#Timer for counter updates with rates
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 10
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	
		
func _on_timer_timeout() -> void:
	Global.energy_current += 13
	$CurrentEnergy.text = String(Global.energy_current)
	print("test")
	print(Global.energy_current)
	print(Global.energy_rate)
	print(Global.energy_max)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
