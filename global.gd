extends Node

var new_game

#World Generation Options
var world_type
var world_size

#Facilities
var hq = 0

#===============================================
#Productions
#Provisions
var provision = [{
	"provision-tier-1":{
		"name":"Provision Station",
		"tier":"1",
		"type":"food",
		"rate":"10"
	},
	"provision-tier-2":{
		"name":"Provision Station",
		"tier":"2",
		"type":"food",
		"rate":"10"
	},
	"provision-tier-3":{
		"name":"Provision Station",
		"tier":"3",
		"type":"food",
		"rate":"10"
	}
}]

#Solar Power Station
var SPS = [{
	"sps-tier-1":{
		"name":"Solar Power Station",
		"tier":"1",
		"type":"energy",
		"panels":"12",
		"max":"5000"
	},
	"sps-tier-2":{
		"name":"Solar Power Station",
		"tier":"2",
		"type":"energy",
		"panels":"24",
		"max":"25000"
	},
	"sps-tier-3":{
		"name":"Solar Power Station",
		"tier":"3",
		"type":"energy",
		"panels":"48",
		"max":"50000"
	}
}]

#Life Support System
var LSS = [{
	"lss-tier-1":{
		"name":"Life support System",
		"tier":"1",
		"type":"Oxygen",
		"rate":"10"
	},
	"lss-tier-2":{
		"name":"Life support System",
		"tier":"2",
		"type":"Oxygen",
		"rate":"10"
	},
	"lss-tier-3":{
		"name":"Life support System",
		"tier":"3",
		"type":"Oxygen",
		"rate":"10"
	}
}]

#===============================================
#Hospitality
#Residences
var residences = [{
	"residences-tier-1":{
		"name":"Residence",
		"tier":"1",
		"type":"bedroom",
		"max":"100"
	},
	"residences-tier-2":{
		"name":"Residence",
		"tier":"2",
		"type":"bedroom",
		"max":"300"
	},
	"residences-tier-3":{
		"name":"Residence",
		"tier":"3",
		"type":"bedroom",
		"max":"500"
	}
}]

#Medical Station
var medical = [{
	"medical-tier-1":{
		"name":"Medical Bay",
		"tier":"1",
		"type":"medical",
		"max":"20",
		"effectiveness":"10%"
	},
	"medical-tier-2":{
		"name":"Medical Bay",
		"tier":"2",
		"type":"medical",
		"max":"35",
		"effectiveness":"15%"
	},
	"medical-tier-3":{
		"name":"Medical Bay",
		"tier":"3",
		"type":"medical",
		"max":"50",
		"effectiveness":"25%"
	}
}]

#===============================================
#Military
var armoury = [{
	"provision-tier-1":{
		"name":"Provision Station",
		"tier":"1",
		"type":"food",
		"rate":"10"
	}
}]
var hangar = [{
	"provision-tier-1":{
		"name":"Provision Station",
		"tier":"1",
		"type":"food",
		"rate":"10"
	}
}]

#===============================================
#Development
var research = [{
	"research-tier-1":{
		"name":"Research Station",
		"tier":"1",
		"type":"research",
		"max":"10",
		"effectiveness":"10%"
	},
	"research-tier-2":{
		"name":"Research Station",
		"tier":"2",
		"type":"research",
		"max":"30",
		"effectiveness":"15%"
	},
	"research-tier-3":{
		"name":"Research Station",
		"tier":"3",
		"type":"research",
		"max":"60",
		"effectiveness":"20%"
	}
}]

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
