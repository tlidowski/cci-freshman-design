extends Node

# Called when the node enters the scene tree for the first time.
func hide():
	$Box.hide()

func show():
	$Box.show()
# Replace with function body.

func _ready():
	GlobalVars.connect("mysignal", self, "_gem_add")
	GlobalVars.gem_count = GlobalVars.gem_count

func _gem_add(count):
	$CanvasLayerScene/Box/HBoxContainer/Score.set_text("Gems Collected: {0}".format({"0": str(int(count))}))

# Called every frame. 'delta' is the elapsed time since the previous frame.'
#func _process(delta):
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
