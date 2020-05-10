extends Area2D

func _on_bubble_area_entered(area):
	if "Player" in area.name:
		GlobalVars.addbubble()
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
