#Name: Pewpew (Bullet) Script
#Purpose: Physics of bullet & damage from bullet.
#Version/Date: 2.0 - 8 June 2020
#Author(s): Shirley W
#Dependencies:

extends Area2D

const SPEED = 200
const damage = 10

var velocity = Vector2()
var direction = 1
var dmg = 0

#The direction our player is facing is the direction the bullet will fly.
func set_bullet_direction(dir):
	direction = dir
	if dir == 1:
		$Sprite.flip_h = true

#Number of orbs obtained causes and increase in bullet damage.		
func set_bullet_damage(orbs):
	dmg = damage + (orbs * 10)

#Movement of bullet.
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

#If bullet touches a wall it is destroyed.
#If bullet touches zombie, bullet is destroyed.
func _on_Pewpew_body_entered(body):
	if "Zombie" in body.name:
		body.health -= damage + (GlobalVars.orb * 5)
		#When Zombie health is 0 or less, kill count is incremented and dead() function is called.
		if body.health <= 0:
			body.dead()
			GlobalVars.addkill()
	queue_free()
