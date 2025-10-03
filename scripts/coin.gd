extends Area2D

const GameManager = preload("res://scripts/game_manager.gd")

@onready var game_manager : GameManager = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_point()
	animation_player.play("pickup")
