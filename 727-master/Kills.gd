extends Label

func _ready():
	GlobalVars.connect("zombiesignal", self, "_kill_add")
	
func _kill_add():
	self.set_text("Zombies Killed: {0}".format({"0": str(int(GlobalVars.zombie_kills))}))


	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
