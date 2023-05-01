extends PanelContainer

#Onready variables
@onready var constructPanel = $MarginContainer/HBoxContainer/ConstructPanel
@onready var productionPanel = $MarginContainer/HBoxContainer/ConstructPanel/VBoxContainer2/ProductionPanel
@onready var hospitalityPanel = $MarginContainer/HBoxContainer/ConstructPanel/VBoxContainer2/HospitalityPanel
@onready var militaryPanel = $MarginContainer/HBoxContainer/ConstructPanel/VBoxContainer2/MilitaryPanel
@onready var developmentPanel = $MarginContainer/HBoxContainer/ConstructPanel/VBoxContainer2/DevelopmentPanel

#Variables
var build_mode = false
var build_type

func _ready():
	for i in get_tree().get_nodes_in_group("facilities"):
		i.button_down.connect(initiate_build_mode.bind(i.get_text()))
		
func _on_construct_btn_pressed():
	constructPanel.visible = true
	productionPanel.visible = true

func initiate_build_mode(type):
	build_type = type
	build_mode = true
	get_tree().get_root().get_node("res://Scenes/World Generation/World Generation.tscn").set_build_preview(type, get_global_mouse_position())
	
func _on_research_btn_pressed():
	print("research")


func _on_medical_btn_pressed():
	print("medical")


func _on_crew_btn_pressed():
	print("crew")


func _on_production_pressed():
	hospitalityPanel.visible = false
	militaryPanel.visible = false
	developmentPanel.visible = false
	productionPanel.visible = true


func _on_hospitality_pressed():
	militaryPanel.visible = false
	developmentPanel.visible = false
	productionPanel.visible = false
	hospitalityPanel.visible = true


func _on_military_pressed():
	developmentPanel.visible = false
	productionPanel.visible = false
	hospitalityPanel.visible = false
	militaryPanel.visible = true


func _on_development_pressed():
	productionPanel.visible = false
	hospitalityPanel.visible = false
	militaryPanel.visible = false
	developmentPanel.visible = true
