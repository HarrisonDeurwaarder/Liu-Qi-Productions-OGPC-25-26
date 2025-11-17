extends Node2D

@export var grid_size: int = 128
@export var grid_width: int = 32
@export var grid_height: int = 32

func _draw():
	for x in range(grid_width + 1):
		draw_line(Vector2(x * grid_size, 0), Vector2(x * grid_size, grid_height * grid_size), Color.WHITE)
	for y in range(grid_height + 1):
		draw_line(Vector2(0, y * grid_size), Vector2(grid_width * grid_size, y * grid_size), Color.WHITE)
