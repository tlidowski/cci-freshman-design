# Much of the code is referenced from youtuber UmaiPixel's "GoDot 3 - Platformer Tutorial" videos.
# I did not copy and paste anything.
extends KinematicBody2D

onready var sprite = get_node("AnimatedSprite")
onready var hpbar = get_node("HealthBar")

const SPEED = 100
const GRAVITY = 9.81
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)
const BULLET = preload("res://Pewpew.tscn")

var velocity = Vector2()
var anim = "idle"
var on_ground = true
var attacking = false
var health = 25

func _physics_process(delta):
	#Movement (left, right, jump)
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		if sign($Position2D.position.x) < 0:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		if sign($Position2D.position.x) > 0:
			$Position2D.position.x *= -1
	else:
		velocity.x = 0
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
			
	# Player attack.
	if Input.is_action_just_pressed("ui_focus_next"): #Press TAB to attack.
		#Creates the bullet when TAB is pressed.
		var bullet = BULLET.instance()
		if sign($Position2D.position.x) > 0:
			bullet.set_bullet_direction(1) #If player is facing right, shoot bullet right.
		else:
			bullet.set_bullet_direction(-1) #If player is facing left, shoot bullet left.
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position #Bullet emerges from the position of player's gun.
	
	# GRAVITY! No double jumping!
	velocity.y +=  GRAVITY
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false

	velocity = move_and_slide(velocity, FLOOR)
	#Sprite animation.
	if velocity.x == 0:
		if Input.is_action_pressed("ui_focus_next"): # Press TAB.
			anim = "attack"
		else:
			anim = "idle"
	else:
		if Input.is_action_pressed("ui_focus_next"):
			anim = "attack"
		else:
			anim = "move"
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)
	sprite.play(anim)

	
func _on_PlayerArea2D_area_entered(area):
	if health <= 0:
		get_tree().reload_current_scene()
	else:
		if "Zombie" in area.name:
			health += area.damage
			hpbar.set_value(health)

