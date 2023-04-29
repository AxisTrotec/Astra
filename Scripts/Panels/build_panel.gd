extends PanelContainer

@onready var constructList = $"MarginContainer/VBoxContainer/ConstructBtn/HBoxContainer"
@onready var constructBtn = $"MarginContainer/VBoxContainer/ConstructBtn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_construct_btn_pressed():
	print("test")
	constructList.visible = true

func _on_research_btn_pressed():
	print("research")


func _on_medical_btn_pressed():
	print("medical")


func _on_crew_btn_pressed():
	print("crew")
