extends Camera2D

@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	'''
	N.B. worldSizeInPixels has been SCALED by 2 because the tiles
	themselves been scaled by 2 to make them bigger. This can be 
	removed when real art comes in.
	'''
	var worldSizeInPixels = mapRect.size * tileSize * 2
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
