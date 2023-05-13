extends Node

var new_game

#World Generation Options
var world_type
var world_size

var list = ["provision", "sps", "lss", "residences", "medical", "armoury", "hangar", "research"]

#Build verification
var build_valid = true

#Facilities
var hq = 0

#Facilities
var provision = []
var sps = []
var lss = []
var residences = []
var medical = []
var armoury = []
var hangar = []
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
	facilities_init()
	
func get_data(file):
	var data = FileAccess.open("res://Data/"+ file +".json", FileAccess.READ)
	var json = JSON.new()
	json.parse(data.get_as_text())
	return json.get_data()[file]
	
func facilities_init():
	for file in list:
		
		var data = get_data(file)
		
		for i in range(len(data)):
			if file == 'provision':
				provision.append(data[str(i+1)])
				
			if file == 'sps':
				sps.append(data[str(i+1)])
				
			if file == 'lss':
				lss.append(data[str(i+1)])
				
			if file == 'residences':
				residences.append(data[str(i+1)])
				
			if file == 'medical':
				medical.append(data[str(i+1)])
				
			if file == 'armoury':
				armoury.append(data[str(i+1)])
				
			if file == 'hangar':
				hangar.append(data[str(i+1)])
				
			if file == 'research':
				research.append(data[str(i+1)])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
