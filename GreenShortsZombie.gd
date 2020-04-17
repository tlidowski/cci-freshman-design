extends KinematicBody2D

const SPEED = 30
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

var velocity = Vector2(0, 0)
var dir = 1
var dirup = 1
var anim = "walk"
var on_ground = true
var is_dead = false

onready var time = OS.get_ticks_msec()
onready var zombie = get_node("AnimatedSprite")

#When function is called, all movement ceases and zombie is destroyed.
func dead():
	is_dead = true
	queue_free()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * dir
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
		var switchvel = RandomNumberGenerator.new()
		switchvel.randomize()
		var switchingvel = switchvel.randi_range(1, 100)
		
		#Randomized movement. 
		if switchingvel == 1:
			dir = 1
		elif switchingvel == 100:
			dir = -1
		elif switchingvel == 50:
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
	
func _on_GreenShortsZombie_body_entered(body):
	if "Player" in body.name:
		Global.player_hits += 1
		if Global.player_hits == 4:
			Global.headless_hits = 0
			body.dead()
			queue_free()
	queue_free()
