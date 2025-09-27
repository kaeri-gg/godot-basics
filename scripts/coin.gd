extends Area2D

const GameManager = preload("res://scripts/game_manager.gd")

@onready var game_manager : GameManager = %GameManager

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_point()
	queue_free()
