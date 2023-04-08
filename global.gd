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
	#If new game, add facilities to variables
	print(new_game)
	if new_game:
		hq = 1
		
		#Set energy to the default
		energy_max = 5000
		energy_current = 500
		energy_rate = 13
		
#		#Set food to the default
#		food_max = 50000
#		food_current = 10
#		food_rate = 10
#
#		#Set food to the default
#		oxygen_max = 0
#		oxygen_current = 0
#		oxygen_rate = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
