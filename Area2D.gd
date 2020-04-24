extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
<<<<<<< HEAD
func _ready():
	pass # Replace with function body.
=======
func _process(delta):
	var overlaps = get_overlapping_bodies()
	for body in overlaps:
		if "Monster" in body.name:
			print('x')
			body.dead()
# Replace with fzunction body.
>>>>>>> 754be0b2009d085ea5eed298561304303b081e84


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
<<<<<<< HEAD
#	pass
=======
#

func _on_PlayerArea_body_entered(body):
	if "Zombie" in body.name:
		print('x')
		connect("area_entered", get_parent(), "dead")
		
>>>>>>> 754be0b2009d085ea5eed298561304303b081e84
