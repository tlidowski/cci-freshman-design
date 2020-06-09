#Name: Change Scene
#Purpose: Allows interaction with the bubble sprite.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Tia L
#Dependencies:
#-----------
#Note: There are multiple Change Scene scripts for 
#levels that have a different number of necessary amount of gems to proceed.

extends Area2D

export(String, FILE, "*.tscn") var target_stage

#When the necessary amount of gems are collected, when the Player enters the Portal sprite's area,
#proceed to the next level.
func _on_ChangeScene_body_entered(body):
	if "Player" in body.name:
		if GlobalVars.gem_count >= 3:
			get_tree().change_scene(target_stage)
