extends Control

@onready var worldtype_option = $Panel/world_type
@onready var worldsize_option = $Panel/world_size


func _ready():
	add_item()

func add_item():
	#World size options
	worldsize_option.add_item("Small")
	worldsize_option.add_item("Medium")
	worldsize_option.add_item("Large")
	
	#World type options
	worldtype_option.add_item("Nero")
	worldtype_option.add_item("Gaia-1-247")

#World Size
func _on_OptionButton_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		Global.world_size = "small"
	elif current_selected == 1:
		Global.world_size = "medium"
	elif current_selected == 2:
		Global.world_size = "large"

#World Type
func _on_world_type_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		Global.world_type = "Nero"
	elif current_selected == 1:
		Global.world_type = "Gaia"


func _on_button_pressed():
	Global.new_game = true
	
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
		
	get_tree().change_scene_to_file("res://Scenes/World Generation/World Generation.tscn")
