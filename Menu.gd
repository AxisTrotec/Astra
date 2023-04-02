extends Node2D

enum PopupIds {
	SHOW_LAST_MOUSE_POSITION = 100
	SAY_HI
}

var _last_mouse_pos

@onready var _pm = $PopupMenu

func _ready():
	_pm.show
	#_pm.connect("id_pressed", self,"_on_Popup_id_pressed")
	#_pm.connect("index_pressed", self,"_on_Popup_index_pressed")

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		_last_mouse_pos = get_global_mouse_position()
		_pm.popup(Rect2(_last_mouse_pos.x, _last_mouse_pos.y, _pm.size.x, _pm.size.y))
		print("test")
		
