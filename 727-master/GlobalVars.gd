extends Node

var rotting_hits = 0
var green_hits = 0
var headless_hits = 0
var zombie_hits = 0
var gem_count = 0
var zombie_kills = 0
var orbs = 0

signal mysignal()
signal zombiesignal()

func addgem():
	self.gem_count += 1
	print(self.gem_count)
	emit_signal("mysignal")

func addkill():
	self.zombie_kills += 1
	emit_signal("zombiesignal")
	
func addorb():
	self.orbs += 1
	emit_signal("orbsignal")
