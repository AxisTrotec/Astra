extends TileMap

@export var width = 0
@export var height = 0
@onready var HQ = get_parent().get_child(1)
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var moisture = FastNoiseLite.new()

#2560 x 1440
func world_size(size):
	if size == '0':
		width = 600
		height = 600
	elif size == '1':
		width = 1200
		height = 720
	elif size == '2':
		width = 2560
		height = 1440

func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var alti = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			set_cell(0, Vector2(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2i(1,1))
	
func _ready():
	temperature.seed = randi()
	altitude.seed = randi()
	moisture.seed = randi()

func _process(delta):
	generate_chunk(HQ.position)
