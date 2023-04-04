extends Node

var new_game = false

#World Generation Options
var world_type
var world_size

#Facilities
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
	if new_game:
		provision.append({
			id = provision.size(),
			tier = 1
		})
		SPP.append({
			id = SPP.size(),
			tier = 1
		})
		LSS.append({
			id = LSS.size(),
			tier = 1
		})
		residences.append({
			id = residences.size(),
			tier = 1
		})
		medical.append({
			id = medical.size(),
			tier = 1
		})
		armoury.append({
			id = armoury.size(),
			tier = 1
		})
		hangar.append({
			id = hangar.size(),
			tier = 1
		})
		research.append({
			id = research.size(),
			tier = 1
		})

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
