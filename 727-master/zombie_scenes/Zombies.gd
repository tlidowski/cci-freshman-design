extends Node2D

var gszcount = 0
var rzcount = 0
var hzcount = 0

const GSZ = preload("res://zombie_scenes/GreenShortsZombie.tscn")
const RZ = preload("res://zombie_scenes/RottingZombie.tscn")
const HZ = preload("res://zombie_scenes/HeadlessZombie.tscn")

func _ready():
	GlobalVars.resetzombie()
	while gszcount != 2:
		var zombie = GSZ.instance()
		add_child(zombie)
		gszcount += 1
		GlobalVars.addzombie()
	while rzcount != 2:
		var zombie = RZ.instance()
		add_child(zombie)
		rzcount += 1
		GlobalVars.addzombie()
	while hzcount != 2:
		var zombie = HZ.instance()
		add_child(zombie)
		hzcount += 1
		GlobalVars.addzombie()
