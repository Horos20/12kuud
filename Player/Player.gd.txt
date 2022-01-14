extends KinematicBody2D

const acceleration = 512
const max_speed = 64
const friction = 0.25
const air_resistance = 0.02
const gravity = 200
const jump_force = 128

var velocity = Vector2.ZERO

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		velocity.x += x_input * acceleration * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
		
	velocity.y += gravity * delta
	
	if is_on_floor():
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, friction)
			
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jump_force
	
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < -jump_force/2:
			velocity.y = -jump_force/2
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, air_resistance)
	
	velocity = move_and_slide(velocity, Vector2.UP)
