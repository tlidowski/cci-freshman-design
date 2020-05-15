extends KinematicBody2D

const GRAVITY = 9.81
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
