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
		Global.world_type= "Nero"
	elif current_selected == 1:
		Global.world_type = "Gaia"


func _on_button_pressed():
	Global.new_game = true
	get_tree().change_scene_to_file("res://Scenes/World Generation.tscn")
