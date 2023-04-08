extends Node

var new_game

#World Generation Options
var world_type
var world_size

#Facilities
var hq = 0

#Productions
var provision = []
var SPP = []
var LSS = []

#Hospitality
var residences = []
var medical = []

#Military
var armoury = []
var hangar = []

#Development
var research = []

#Counters
var energy_max
var energy_current
var energy_rate

var food_max
var food_current
var food_rate

var oxygen_max
var oxygen_current
var oxygen_rate

func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
