extends CanvasLayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func hide():
	$Box.hide()

func show():
	$Box.show()
# Replace with function body.

func _ready():
	GlobalVars.connect("gem_add", self, "_gem_add")
	
	# Replace with function body.
func _gem_add(gem_count):
	$Box/HBoxContainer/Score.text = str(int(gem_count))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
