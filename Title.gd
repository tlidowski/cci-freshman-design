extends Node

func _ready():
	pass # Replace with function body.



func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scene1.tscn")



func _on_TextureButton2_pressed():
	get_tree().quit()
