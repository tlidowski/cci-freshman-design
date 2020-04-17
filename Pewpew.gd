extends Area2D

const SPEED = 200

var velocity = Vector2()
var direction = 1

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
		if "Rotting" in body.name:
			Global.rotting_hits += 1
			if Global.rotting_hits == 2:
				Global.rotting_hits = 0
				body.dead()
			queue_free()
		elif "GreenShorts" in body.name:
			Global.green_hits += 1
			if Global.green_hits == 2:
				Global.green_hits = 0
				body.dead()
			queue_free()
		elif "Headless" in body.name:
			Global.headless_hits += 1
			if Global.headless_hits == 1:
				Global.headless_hits = 0
				body.dead()
			queue_free()
	queue_free()
