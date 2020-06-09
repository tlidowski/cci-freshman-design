#Name: Gem
#Purpose: Allows interaction with the gem sprite.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C, Shirley W
#Dependencies:

extends Area2D

#If Player touches the gem, it is picked up (gem disappears and gem counter is incremented).
func _on_Gem_area_entered(area):
	if "Player" in area.name:
		GlobalVars.addgem()
		queue_free()
