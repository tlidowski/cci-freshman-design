extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "te
# Called when the node enters the scene tree for the first time.
func _on_Gem_body_entered(body):
	if "Player" in body.name:
		queue_free()
		
