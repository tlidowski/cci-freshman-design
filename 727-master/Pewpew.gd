extends Area2D

const SPEED = 200

var velocity = Vector2()
var direction = 1
var damage = 10

#The direction our player is facing is the direction the bullet will fly.
func set_bullet_direction(dir):
	direction = dir
	if dir == 1:
		$Sprite.flip_h = true

#Movement of bullet.
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

#If bullet touches a wall it is destroyed.
#If bullet touches zombie, dead() function is called and bullet is destroyed.
func _on_Pewpew_body_entered(body):
	if "Zombie" in body.name:
		body.health -= damage
		if body.health <= 0:
			body.dead()
			GlobalVars.addkill()
	queue_free()
