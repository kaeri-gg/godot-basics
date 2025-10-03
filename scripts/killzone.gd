extends Area2D

const Player = preload("res://scripts/player.gd")
const GameManager = preload("res://scripts/game_manager.gd")

@onready var game_manager : GameManager = %GameManager
@onready var timer: Timer = $Timer

func _on_body_entered(player: Player) -> void:
	Engine.time_scale = 0.5
	player.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
