extends Control

func _on_NewGameBtn_pressed():
	get_tree().change_scene_to_file("res://Menus/WorldGenOptions/WGOptionsMenu.tscn")


func _on_LoadGameBtn_pressed():
	print("Load Game")


func _on_OptionsBtn_pressed():
	print("Options")
