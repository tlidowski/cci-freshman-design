extends KinematicBody2D

const SPEED = 50
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)
const GEM = preload("res://gem.tscn")



var velocity = Vector2(0, 0)
var dir = 1
var dirup = 1
var anim = "walk"
var on_ground = true
var is_dead = false
var health = 50

onready var time = OS.get_ticks_msec()
onready var zombie = get_node("AnimatedSprite")
onready var hpbar = get_node("HealthBar")
	
#When function is called, all movement ceases and zombie is destroyed.
func dead():
	is_dead = true
	var gem = GEM.instance()
	get_parent().add_child(gem)
	gem.position = $Position2D.global_position
	queue_free()
	add_child(self)

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * dir
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
		var switchvel = RandomNumberGenerator.new()
		switchvel.randomize()
		var switchingvel = switchvel.randi_range(1, 100)
		
		#Randomized movement. 
		if switchingvel == 1: #If number randomed is 1, move right.
			dir = 1
		elif switchingvel == 100: #If number randomed is 100, move left.
			dir = -1
		elif switchingvel == 50: #If number randomed is 50, jump.
			if on_ground == true:
				velocity.y = JUMP_POWER
				on_ground = false
				
		#If touching a wall, go the other direction.
		if is_on_wall():
			dir *= -1
			$AnimatedSprite/RayCast2D.position.x *= -1
		
		#No double jumping!
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
	
		#Switches direction of zombie depending on direction it's velocity is.
		if dir > 0:
			zombie.set_flip_h(false)
		elif dir < 0:
			zombie.set_flip_h(true)
		zombie.play(anim)
			
		hpbar.set_value(health)
		

