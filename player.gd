extends CharacterBody2D

@onready var dash_timer: Timer = $dash_timer
@onready var dash_again_timer: Timer = $dash_again_timer

const SPEED = 50.0
const JUMP_VELOCITY = -250.0

const DASH_SPEED = 900.

var dashing:bool = false
var can_dash:bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
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
