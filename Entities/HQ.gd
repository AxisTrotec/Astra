extends Node2D

var innerBuildValid = true

func _ready():
	
	#If new game, add facilities to variables
	if Global.new_game:
		Global.hq = 1
		
		#Set energy to the default
		Global.energy_max = 5000
		Global.energy_current = 500
		Global.energy_rate = 13
		
#		#Set food to the default
		Global.food_max = 50000
		Global.food_current = 10
		Global.food_rate = 10
#
#		#Set food to the default
		Global.oxygen_max = 0
		Global.oxygen_current = 0
		Global.oxygen_rate = 0

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		self.on_click()

func on_click():
	print("Click")

func _on_inner_area_2d_area_entered(area):
	innerBuildValid = false

func _on_inner_area_2d_area_exited(area):
	innerBuildValid = true
	
func _on_outer_area_2d_area_entered(area):
	if !innerBuildValid:
		Global.build_valid = false
	else:
		Global.build_valid = true

func _on_outer_area_2d_area_exited(area):
	Global.build_valid = false
