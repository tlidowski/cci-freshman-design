#Name: Upgrades
#Purpose: Spawn upgrade items randomly in the map.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C, Shirley W
#Dependencies: Orb.tscn, bubble.tscn

extends KinematicBody2D

#Preloads orb and bubble scenes so they can be instanced later in code
const ORB = preload("res://item_scenes/Orb.tscn")
const BUBBLE = preload("res://item_scenes/bubble.tscn")

#Randomly determines the type and in-game position of item intermittently dropped through utilization of random number generators.
func _physics_process(delta):
	
	#Random number generator is randomized to determine whether orb or bubble is dropped through utilization of resulting variable "spawnitem"
	var spawn = RandomNumberGenerator.new()
	spawn.randomize()
	var spawnitem = spawn.randi_range(1, 5000)
	if spawnitem == 4148 or spawnitem == 1219 or spawnitem == 1131:
		#instances orb, makes sure that orb does not disappear even if current node does by adding orb as child of current node's parent.
		var orb = ORB.instance()
		get_parent().add_child(orb)
		#Another random number generator is randomized to obtain integer to add to current x position and integer to add to current y position
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		orb.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		orb.position.y = self.position.y + posadded
	elif spawnitem == 3060:
		#instances orb, makes sure that orb does not disappear even if current node does by adding orb as child of current node's parent.
		var bubble = BUBBLE.instance()
		get_parent().add_child(bubble)
		#Another random number generator is randomized to obtain integer to add to current x position and integer to add to current y position
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		bubble.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		bubble.position.y = self.position.y + posadded
