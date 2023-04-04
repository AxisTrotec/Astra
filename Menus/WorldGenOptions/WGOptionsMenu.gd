extends Control

@onready var worldsize_option = $Panel/OptionButton

#var worldgen = get_node()
#preload("res://Scenes/World Generation.tscn")
#get_node("other_node_with_script).yourfunction() or get_node("other_node_with_script).yourvar
#var worldgeninstance = worldgen.instantiate()

func _ready():
	add_item()

func add_item():
	worldsize_option.add_item("Small")
	worldsize_option.add_item("Medium")
	worldsize_option.add_item("Large")

func _on_OptionButton_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		Global.world_size = "small"
	elif current_selected == 1:
		Global.world_size = "medium"
	elif current_selected == 2:
		Global.world_size = "large"


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/World Generation.tscn")
