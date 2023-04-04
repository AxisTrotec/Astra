extends Node2D

@onready var tilemap = $TileMap

@export var width = 600
@export var height = 600
@onready var HQ = get_parent().get_child(1)
var temperature = {}
var altitude = {}
var moisture = {}

var noise_map
var altitude_noise_layer = {}
@export var alt_freq : float = 0.005
@export var oct : int = 4
@export var lac : int = 2
@export var gain : float = 0.5
@export var amplitude : float = 1.0

func generate_map(per, oct):
	noise_map = FastNoiseLite.new()
	noise_map.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise_map.seed = randi()
	noise_map.frequency = per
	noise_map.fractal_octaves = oct
	
	var grid = {}
	for x in range(width):
		for y in range(height):
			var rand = abs(noise_map.get_noise_2d(x,y) * 2 - 1 )
			grid[Vector2i(x, y)] = rand
	return grid

func generate_biomes(width, height):
	for x in width:
		for y in height:
			var pos = Vector2i(x,y)
			tilemap.set_cell(0,pos,0,Vector2i(6,15))

#func generate_chunk(position):
#	var tile_pos = local_to_map(position)
#	for x in range(width):
#		for y in range(height):
#			var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
#			var alti = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
#			var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
#			set_cell(0, Vector2(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2i(1,1))
	
func _ready():
	temperature.seed = generate_map(300,5)
	moisture.seed = generate_map(300,5)
	altitude.seed = generate_map(150,5)

	if Global.world_size == 'small':
		print("small")
		width = 600
		height = 600
	elif Global.world_size == 'medium':
		print("medium")
		width = 1200
		height = 720
	elif Global.world_size == 'large':
		print("large")
		width = 2560
		height = 1440

	generate_biomes(width,height)
	
#func _process(delta):
#	generate_chunk(HQ.position)
