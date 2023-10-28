extends TileMap

@onready var tilemap = $TileMap
@onready var HQ = $"Facilities/HQ"
@onready var preloadSprite = load("res://Scenes/Test.tscn")

var width = 600
var height = 600

var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var moisture = FastNoiseLite.new()

enum ENTITY_TYPE {FACILITY, OBSTACLE}

var tile_size = 64

var grid_size = Vector2(64, 64)
var grid = []

func _ready():
	temperature.seed = randi()
	moisture.seed = randi()
	altitude.seed = randi()

	if Global.world_size == 'small':
		width = 600
		height = 600
	elif Global.world_size == 'medium':
		width = 1200
		height = 720
	elif Global.world_size == 'large':
		width = 2560
		height = 1440

	generate_chunk(HQ.position)
	#generate_obs()

func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var alti = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)
			var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)

			if moist < 0.1:
				set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2(1,0))

			elif moist > 0.1 and moist < 0.2:
				set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2(2,0))

			elif moist > 0.2 and moist < 0.3:
				set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 +y),0, Vector2(0,0))

func generate_obs():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
			
	var positions = []
	for n in range(5):
		var grid_pos = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y))
		
		if not grid_pos in positions:
			positions.append(grid_pos)
			
	for pos in positions:
		var new_obs = preloadSprite.instantiate()
		new_obs.position = map_to_local(pos)
		
		grid[pos.x][pos.y] = ENTITY_TYPE.OBSTACLE
		
		self.get_child(1).add_child(new_obs)
