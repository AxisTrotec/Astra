extends Label

func _on_gui_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == 1:
		print("Energy")
