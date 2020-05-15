extends Node

var gem_count = 0
var zombie_kills = 0
var orb = 0
var bubbles = 0

signal gemsignal()
signal zombiesignal()
signal orbsignal()
signal bubblesignal()

func addgem():
	self.gem_count += 1
	emit_signal("gemsignal")

func addkill():
	self.zombie_kills += 1
	emit_signal("zombiesignal")
	
func orbobtained():
	self.orb += 1
	emit_signal("orbsignal")

func bubbleobtained():
	self.bubbles += 1
	emit_signal("bubblesignal")
