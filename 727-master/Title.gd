#Name: Title
#Purpose: Allows the Title scene to work
#Version/Date: 1.0 - 8 June 2020
#Author(s): Tia L
#Dependencies:

extends Node

func _ready():
	pass 
	
#When the Start button is pressed, scene changes to Level 0, effectively starting the game.	
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Level0.tscn")

#When the Exit button is pressed, the window closes, effectively exiting the game.
func _on_TextureButton2_pressed():
	get_tree().quit()
