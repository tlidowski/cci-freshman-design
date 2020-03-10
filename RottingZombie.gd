extends KinematicBody2D
const SPEED = 50
const GRAVITY = 9.81
const JUMP_POWER = -275
const FLOOR = Vector2(0, -1)
var velocity = Vector2(0, 0)
var dir = 1
var dirup = 1
onready var time = OS.get_ticks_msec()

func _physics_process(delta):
	velocity.x = SPEED * dir
	velocity.y += GRAVITY * dirup
	velocity = move_and_slide(velocity, FLOOR)
	var switchvel = RandomNumberGenerator.new()
	switchvel.randomize()
	var switchingvel = switchvel.randi_range(1,12)
	if is_on_wall():
		dir *= -1
		$tile000/RayCast2D.position.x *= -1
		if $tile000/RayCast2D.is_colliding() != true:
			dir *= -1
			$tile000/RayCast2D.position.x *= -1
	elif $tile000/RayCast2D.is_colliding() != true:
		dir *= -1
		$tile000/RayCast2D.position.x *= -1
	else:
		if switchingvel == 5:
			dir *= -1

