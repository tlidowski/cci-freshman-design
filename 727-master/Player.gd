#Name: Player
#Purpose: Includes all actions relating to the Player. Allows movement, animation, and interaction.
#Version/Date: 2.0 - 8 June 2020
#Author(s): Shirley W
#Dependencies:
#-----------
#Much of the code is referenced from youtuber UmaiPixel's "GoDot 3 - Platformer Tutorial" videos.
# I did not copy and paste anything.

extends KinematicBody2D

onready var sprite = get_node("AnimatedSprite")
onready var hpbar = get_node("HealthBar")

const SPEED = 100
const GRAVITY = 9.81
const JUMP_POWER = -270
const FLOOR = Vector2(0, -1)
const BULLET = preload("res://item_scenes/Pewpew.tscn")

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
			
	#Player attack. Creates a bullet scene where the Player's gun is, when Tab is pressed. 
	#Depending on the direction the player is facing, the bullet flies in that direction until hitting a wall or zombie.
	if Input.is_action_just_pressed("ui_focus_next"): 
		var bullet = BULLET.instance()
		bullet.set_bullet_damage(GlobalVars.orb)
		if sign($Position2D.position.x) > 0:
			bullet.set_bullet_direction(1)
		else:
			bullet.set_bullet_direction(-1)
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position 
	
	#Gravity. Restricts player from double jumping.
	velocity.y +=  GRAVITY
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		
	velocity = move_and_slide(velocity, FLOOR)
	
	#Sprite animation changes depending on what key is pressed.
	if velocity.x == 0:
		if Input.is_action_pressed("ui_focus_next"):
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

#Interacts with player health.
#If player's health is 0 or lower, player dies and scene is reloaded.
#If player obtains a bubble, health is increased or healed by 3.
#If player touches a zombie, health is lowered depending on the zombie's damage.
func _on_Player_area_entered(area):
	if health <= 0:
		GlobalVars.reset()
		get_tree().reload_current_scene()
	else:
		if "Zombie" in area.name:
			health += area.damage
			hpbar.set_value(health)
		if "bubble" in area.name:
			health += (GlobalVars.bubbles * 3)
			hpbar.set_value(health)
