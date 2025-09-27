extends Area2D


@onready var timer: Timer = $Timer

func _on_body_entered(player: Node2D) -> void:
	Engine.time_scale = 0.5
	player.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
