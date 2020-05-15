extends KinematicBody2D

const ORB = preload("res://Orb.tscn")
const BUBBLE = preload("res://bubble.tscn")

func _physics_process(delta):
	var spawn = RandomNumberGenerator.new()
	spawn.randomize()
	var spawnitem = spawn.randi_range(1, 1000)
	if spawnitem == 300 or spawnitem == 600 or spawnitem == 900:
		var orb = ORB.instance()
		get_parent().add_child(orb)
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		orb.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		orb.position.y = self.position.y + posadded
	elif spawnitem == 500:
		var bubble = BUBBLE.instance()
		get_parent().add_child(bubble)
		var posadd = RandomNumberGenerator.new()
		posadd.randomize()
		var posadded = posadd.randi_range(2, 600)
		bubble.position.x = self.position.x + posadded
		posadded = posadd.randi_range(60, 300)
		bubble.position.y = self.position.y + posadded
