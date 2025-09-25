extends CharacterBody2D

@onready var dash_timer: Timer = $dash_timer
@onready var dash_again_timer: Timer = $dash_again_timer

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
		_reset_jumps()

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps > 0:
		velocity.y = JUMP_VELOCITY
		jumps -= 1
		
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		dash_timer.start()
		dash_again_timer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
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
