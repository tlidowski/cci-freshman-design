extends Area2D

func _on_orb_area_entered(area):
	if "Player" in area.name:
		GlobalVars.addorb()
		queue_free()# Replace with function body.
# Replace with function body.
