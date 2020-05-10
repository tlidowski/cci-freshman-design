extends Area2D

func _on_Gem_area_entered(area):
	if "Player" in area.name:
		GlobalVars.addgem()
		queue_free()
		


 # Replace with function body.
