extends Sprite
var scene = preload("res://ScoreLabel.tscn")




func _on_Gem_body_entered(body):
	if "Player" in body.name:
		GlobalVars.add()		
		var score = scene.instance()
		get_parent().add_child(score)
		GlobalVars.connect("mysignal",self, "_gem_add")	
		GlobalVars.gem_count = GlobalVars.gem_count
		var count = GlobalVars.gem_count
		score._gem_add(count)		
		queue_free()# Replace with function body.
