extends Control


@onready var worldsize_option = $Panel/OptionButton

func _ready():
	add_item()

func add_item():
	worldsize_option.add_item("Small")
	worldsize_option.add_item("Medium")
	worldsize_option.add_item("Large")

func _on_OptionButton_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		pass
	elif current_selected == 1:
		pass
	elif current_selected == 2:
		pass
