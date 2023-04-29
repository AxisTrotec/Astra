extends Button

@onready var constructList = $"HBoxContainer"

# Called when the node enters the scene tree for the first time.
func _ready():
	var constructListPosX = get_global_mouse_position().x + 84
	var constructListPosY = get_global_mouse_position().y + 136
	print(get_global_mouse_position().x)
	print(constructListPosX)
	constructList.visible = true
	constructList.set_position(Vector2(constructListPosX, constructListPosY))
	constructList.scale.x = 20
	constructList.scale.y = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
