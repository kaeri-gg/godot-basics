extends CharacterBody2D

const GameManager = preload("res://scripts/game_manager.gd")

@onready var game_manager : GameManager = %GameManager
@onready var dash_timer: Timer = $dash_timer
@onready var dash_again_timer: Timer = $dash_again_timer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const DASH_SPEED = 900.0
const JUMP_VELOCITY = -250.0

var dashing: bool = false
var can_dash: bool = true
var jumps: int = _get_default_jumps()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		game_manager.save_checkpoint(self.position)
		_reset_jumps()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps > 0:
		jump()
		
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		dash_timer.start()
		dash_again_timer.start()


	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else: 
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	
	
	if direction:
		if dashing:
			velocity.x = direction * DASH_SPEED
		else:	
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#make it stop dashing
func _on_dash_timer_timeout() -> void:
	dashing = false # Replace with function body.

func _on_dash_again_timer_timeout() -> void:
	can_dash = true

func _get_default_jumps() -> int:
	return 3

func _reset_jumps() -> void:
	jumps = _get_default_jumps()

func jump() -> void:
	velocity.y = JUMP_VELOCITY
	jumps -= 1
