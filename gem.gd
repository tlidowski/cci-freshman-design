extends Area2D

func _on_Gem_area_entered(area):
	if "Player" in area.name:
		queue_free()
		

