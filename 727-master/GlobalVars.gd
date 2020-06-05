extends Node

var gem_count = 0
var zombie_kills = 0
var orb = 0
var bubbles = 0
var zombies = 0

signal gemsignal()
signal zombiesignal()
signal orbsignal()
signal bubblesignal()
signal zcountsignal()

func reset():
	self.gem_count = 0
	self.zombie_kills = 0
	self.orb = 0
	self.bubbles = 0
	self.zombies = 0

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
	
func addzombie():
	self.zombies += 1
	emit_signal("zcountsignal")
	
