extends Area2D

const SPEED = 200
var velocity = Vector2()

func _ready():
	pass 

func _physics_process(delta):
	velocity.x = SPEED * delta
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
