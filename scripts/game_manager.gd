extends Node

var score: int = 0
var checkpoint: Vector2

func add_point(p: int = 1) -> void:
	score += p
	print(score)

func save_checkpoint(location: Vector2) -> void:
	checkpoint = location

func get_checkpoint() -> Vector2:
	return checkpoint
	
