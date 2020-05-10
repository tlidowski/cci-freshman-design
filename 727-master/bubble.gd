extends Area2D

func _on_bubble_area_entered(area):
	if "Player" in area.name:
		GlobalVars.bubbleobtained()
		queue_free()
