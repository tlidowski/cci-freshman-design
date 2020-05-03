extends Area2D
# Called when the node enters the scene tree for the first time.

		#Replace with function body.
func _on_Gem_area_entered(area):
	if "Player" in area.name:
		queue_free()
		

