#Name: Upgrades
#Purpose: Spawn upgrade items randomly in the map.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C, Shirley W
#Dependencies: Orb.tscn, bubble.tscn

extends KinematicBody2D

const ORB = preload("res://item_scenes/Orb.tscn")
const BUBBLE = preload("res://item_scenes/bubble.tscn")

func _physics_process(delta):
	var spawn = RandomNumberGenerator.new()
	spawn.randomize()
	var spawnitem = spawn.randi_range(1, 5000)
	if spawnitem == 4148 or spawnitem == 1219 or spawnitem == 1131:
		var orb = ORB.instance()
		get_parent().add_child(orb)
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		orb.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		orb.position.y = self.position.y + posadded
	elif spawnitem == 3060:
		var bubble = BUBBLE.instance()
		get_parent().add_child(bubble)
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		bubble.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		bubble.position.y = self.position.y + posadded
