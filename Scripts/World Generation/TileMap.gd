extends TileMap

@onready var tilemap = $TileMap

@export var width = 64
@export var height = 64
@onready var HQ = $"Facilities/HQ"
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var moisture = FastNoiseLite.new()
	
func _ready():
	temperature.seed = randi()
	moisture.seed = randi()
	altitude.seed = randi()

#	if Global.world_size == 'small':
#		print("small")
#		width = 600
#		height = 600
#	elif Global.world_size == 'medium':
#		print("medium")
#		width = 1200
#		height = 720
#	elif Global.world_size == 'large':
#		print("large")
#		width = 2560
#		height = 1440
		
	generate_chunk(HQ.position)
	
#func _process(delta):
#	generate_chunk(HQ.position)
	
func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var alti = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			set_cell(0, Vector2(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2i(0,0))
			
