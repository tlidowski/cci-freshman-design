extends KinematicBody2D
const SPEED = 50
const GRAVITY = 9.81
const JUMP_POWER = -275
const FLOOR = Vector2(0, -1)
var velocity = Vector2()
var dir = 1
onready var time = OS.get_ticks_msec()
var dirup = 1
func _physics_process(delta):
	velocity.x = SPEED * dir
	velocity.y += GRAVITY * dirup
	velocity = move_and_slide(velocity, FLOOR)
	var switchvel = RandomNumberGenerator.new()
	switchvel.randomize()
	var switchingvel = switchvel.randi_range(3,5)
	if switchingvel == 4:
		dirup *= -2
	else:
		dirup = 1
	if is_on_wall():
		dir *= -1
		$tile001/RayCast2D.position.x *= -1
		if $tile001/RayCast2D.is_colliding() != true:
			dir *= -1
			$tile001/RayCast2D.position.x *= -1
	elif $tile001/RayCast2D.is_colliding() != true:
		dir *= -2
		$tile001/RayCast2D.position.x *= -1

