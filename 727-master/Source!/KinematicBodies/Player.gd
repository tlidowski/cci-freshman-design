extends KinematicBody2D

onready var sprite = get_node("sprite")
onready var Ladder = get_node("Ladder")

const SPEED = 100
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)
const BULLET = preload("res://Pewpew.tscn")

var velocity = Vector2()
var anim = "idle(right)"
var on_ground = false
var attacking = false


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
	
	if Input.is_action_just_pressed("ui_down"):
		var bullet = BULLET.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
	
	velocity.y +=  GRAVITY
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false

	velocity = move_and_slide(velocity, FLOOR)

	
	if velocity.x == 0:
		if Input.is_action_pressed("ui_down"):
			anim = "attack"
		else:
			anim = "idle"
	else:
		if Input.is_action_pressed("ui_down"):
			anim = "attack"
		else:
			anim = "move"
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)

	sprite.play(anim)
	
	
