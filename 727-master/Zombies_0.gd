extends Node2D

var gszcount = 0
var rzcount = 0
var hzcount = 0

const GSZ = preload("res://GreenShortsZombie.tscn")
const RZ = preload("res://RottingZombie.tscn")
const HZ = preload("res://HeadlessZombie.tscn")

func _ready():
	while gszcount != 1:
		var zombie = GSZ.instance()
		add_child(zombie)
		gszcount += 1
		GlobalVars.addzombie()
	while rzcount != 1:
		var zombie = RZ.instance()
		add_child(zombie)
		rzcount += 1
		GlobalVars.addzombie()
	while hzcount != 1:
		var zombie = HZ.instance()
		add_child(zombie)
		hzcount += 1
		GlobalVars.addzombie()
