#Name: Bubble
#Purpose: Allows interaction with the bubble sprite.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C, Shirley W
#Dependencies:
extends Area2D

#If Player touches the bubble, it is picked up (bubble disappears and bubble counter is incremented).
func _on_bubble_area_entered(area):
	if "Player" in area.name:
		GlobalVars.bubbleobtained()
		queue_free()
