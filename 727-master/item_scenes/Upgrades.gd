#Name: Upgrades
#Purpose: Spawn upgrade items randomly in the map.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C (content), Shirley W (compilation)
#Dependencies: Orb.tscn, bubble.tscn

extends KinematicBody2D
#Preloads orb and bubble scenes so they can be instanced later in code
const ORB = preload("res://item_scenes/Orb.tscn")
const BUBBLE = preload("res://item_scenes/bubble.tscn")

#Uses random number generation to determine item type and spawn position
func _physics_process(delta):
	#Random number generator is used to generate variable "spawnitem"
	#Variable "spawnitem" determines whether orb or bubble is spawned
	var spawn = RandomNumberGenerator.new()
	spawn.randomize()
	var spawnitem = spawn.randi_range(1, 5000)	
	
	if spawnitem == 4148 or spawnitem == 1219 or spawnitem == 1131:
		#instances orb, sets as child of root
		var orb = ORB.instance()
		get_parent().add_child(orb)
		#Random number generator is randomized to get integer
		#Sum of integer and current x-position is set as orb's x-position
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		orb.position.x = self.position.x + posadded
		#A second integer from generator is added to current y-pos to get orb's y-pos
		posadded = posadd.randi_range(60, 300)
		orb.position.y = self.position.y + posadded		
	elif spawnitem == 3060:
		#instances bubble, sets as child of root
		var bubble = BUBBLE.instance()
		get_parent().add_child(bubble)
		#Random number generator is randomized to get integer 
		#Sum of integer and current x-position is set as orb's x-position
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		bubble.position.x = self.position.x + posadded
		#A second integer from generator is added to current y-pos to get orb's y-pos
		posadded = posadd.randi_range(60, 300)
		bubble.position.y = self.position.y + posadded
