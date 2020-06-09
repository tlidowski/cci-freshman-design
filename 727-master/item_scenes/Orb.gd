#Name: Orb
#Purpose: Sends signal to autoloaded singleton "GlobalVars" script whenever a player "collects" an orb.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C
#Dependencies: Access to GlobalVars is needed for game to be able to keep incrementing global gem count

extends Area2D

#If Player touches the orb, it is picked up (orb disappears and orb counter is incremented).
func _on_orb_area_entered(area):
	if "Player" in area.name:
		GlobalVars.orbobtained()
		queue_free()
