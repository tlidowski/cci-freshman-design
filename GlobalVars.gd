extends Node

var rotting_hits = 0
var green_hits = 0
var headless_hits = 0
var zombie_hits = 0
var gem_count = 0

signal mysignal(count)

func add():
	self.gem_count += 1
	print(self.gem_count)
	emit_signal("mysignal", self.gem_count)
