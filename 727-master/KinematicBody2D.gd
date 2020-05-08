extends KinematicBody2D

onready var sprite = get_node('zombies')

const SPEED = 20
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var anim = "face front"
var on_ground = false
var randomnumber = RandomNumberGenerator.new()

func _physics_process(_delta):
	randomnumber.randomize()
	var x = randomnumber.randi_range(1,2)
	if x == 1:
		velocity.x = -SPEED
	if x == 2:
		velocity.x = SPEED

	velocity.y +=  0
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false

	velocity = move_and_slide(velocity, FLOOR)

	if velocity.x == 0:
		anim = "face front"
	else:
		anim = "left"
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
		
	sprite.play(anim)
