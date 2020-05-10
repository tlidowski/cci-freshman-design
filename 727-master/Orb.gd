extends Area2D

func _on_orb_area_entered(area):
	if "Player" in area.name:
		GlobalVars.orbobtained()
		queue_free()
