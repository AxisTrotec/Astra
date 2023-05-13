extends Node2D

@onready var buildPanel = $CanvasLayer/MainPanel

var buildPanelFlag = false

func _input(event):
	if event is InputEventKey:
		if event.is_pressed():
			if Input.is_key_pressed(KEY_CTRL):
				print(get_global_mouse_position())
				print((get_global_mouse_position() + get_global_mouse_position()))
				
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			build_panel(get_viewport().get_screen_transform().affine_inverse().basis_xform(get_viewport().get_mouse_position()))
			
func build_panel(mouse_pos):
	buildPanelFlag = true
	buildPanel.set_position(mouse_pos)
	buildPanel.visible = true
