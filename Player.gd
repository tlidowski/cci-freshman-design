extends KinematicBody2D

onready var sprite = get_node("sprite")

const SPEED = 60
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)


var velocity = Vector2()
var anim = "idle(right)"
var on_ground = false


func _physics_process(_delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false

	velocity.y +=  GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false

	velocity = move_and_slide(velocity, FLOOR)

	if velocity.x == 0:
		anim = "idle"
	else:
		anim = "move"
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
		
	sprite.play(anim)
