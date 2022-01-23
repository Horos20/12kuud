extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 250
const MAXSPEED = 100
const JUMPFORCE = 370





var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("right"):
		motion.x = MAXSPEED
		$AnimationPlayer.play("runright")
		
	elif Input.is_action_pressed("left"):
		motion.x = -MAXSPEED
		$AnimationPlayer.play("runleft")
		
		
		
	else:
		motion.x = 0
		$AnimationPlayer.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
		
	motion = move_and_slide(motion, UP)
	
