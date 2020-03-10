extends KinematicBody2D
const SPEED = 40
const GRAVITY = 9.81
const JUMP_POWER = -275
const FLOOR = Vector2(0, -1)
var velocity = Vector2(0, 0)
var dir = 1
onready var time = OS.get_ticks_msec()

func _physics_process(delta):
	velocity.x = SPEED * dir
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	if is_on_wall():
		dir *= -1
		$tile002/RayCast2D.position.x *= -1
		if $tile002/RayCast2D.is_colliding() != true:
			dir *= -1
			$tile002/RayCast2D.position.x *= -1
	elif $tile002/RayCast2D.is_colliding() != true:
		dir *= -1
		$tile002/RayCast2D.position.x *= -1
	else:
		if time % (10) == 0:
			dir *= -1

