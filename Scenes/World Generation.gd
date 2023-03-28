extends Node2D

#2560 x 1440
export var width = 600
export var height = 600
onready var tilemap = $TileMap
var temperature = {}
var altitude = {}
var moisture = {}
var biome = {}
var openSimplexNoise = OpenSimplexNoise.new()


func generate_map(per, oct):
	openSimplexNoise.seed = randi()
	openSimplexNoise.period = per
	openSimplexNoise.octaves = oct
	var gridname = {}
	for x in width:
		for y in height:
			var rand := 2*(abs(openSimplexNoise.get_noise_2d(x,y)))
			gridname[Vector2(x,y)] = rand
	return gridname

func _ready():
	temperature = generate_map(300,5)
	moisture = generate_map(300,5)
	altitude = generate_map(150,5)
	set_tile(width,height)

func set_tile(width, height):
	for x in width:
		for y in height:
			var pos = Vector2(x,y)
			#var alt = altitude[pos]
			#var temp = temperature[pos]
			#var moist = moisture[pos]
		
			tilemap.set_cellv(pos, 0)
