extends Area2D
onready var enemy = get_node("enemy")
const SPEED = 70
const GRAVITY = 9.81
const JUMP_POWER = -75
const FLOOR = Vector2(0, -1)
const BULLET = preload("res://Pewpew.tscn")
var velocity = Vector2()
var anim = "idle(right)"
var on_ground = false
var attacking = true
onready var Timer = get_node('TimerforGreenShortsZombie')
func _physics_process(delta):
	var switchvel = RandomNumberGenerator.new()
	switchvel.randomize()
	var switchingvel = switchvel.randi_range(1,2)
	if switchingvel == 1:
		velocity.x = SPEED
	else:
		velocity.x = 2 * -SPEED
	velocity.y +=  GRAVITY
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	if is_on_wall():
		velocity.x = -60 * velocity.x
	velocity = move_and_slide(velocity, FLOOR)

func _on_Area2D_area_exited(area):
	velocity.x = -velocity.x # Replace with function body.
