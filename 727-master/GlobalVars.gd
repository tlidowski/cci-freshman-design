#Name: GlobalVars
#Purpose: Necessary global variables and methods.
#Version/Date: 2.0 - 8 June 2020
#Author(s): Adrienne C, Shirley W
#Dependencies:

extends Node

#Global variables are created.
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

#Resets every variable (usually after a death or moving to the next level).
func reset():
	self.gem_count = 0
	self.zombie_kills = 0
	self.orb = 0
	self.bubbles = 0
	self.zombies = 0

#Increments the gem counter. Keeps track of how many gems are obtained by the player.
func addgem():
	self.gem_count += 1
	emit_signal("gemsignal")

#Resets the gem counter (usually after a death or moving to the next level).
func resetgem():
	self.gem_count = 0
	emit_signal("gemsignal")

#Increments the zombie kill counter. Keeps track of how many zombies killed by player.
func addkill():
	self.zombie_kills += 1
	emit_signal("zombiesignal")

#Increments the orb counter. Keeps track of how many orbs are obtained by the player. 
#Allows orbs to affect the player's damage. Look in "Pewpew.gd" script for more information.
func orbobtained():
	self.orb += 1
	emit_signal("orbsignal")

#Increments the bubbles counter. Keeps track of how many bubbles are obtained by the player. 
#Allows bubbles to affect the player's health. Look in "Player.gd" script for more information
func bubbleobtained():
	self.bubbles += 1
	emit_signal("bubblesignal")

#Resets the zombie counter (usually after a death or moving to the next level).	
func resetzombie():
	self.zombies = 0
	emit_signal("zcountsignal")

#Increments the zombie counter. Keeps track of how many zombies are spawned into the map 
#as well as how many gems the Player needs to progress to the next level.	
func addzombie():
	self.zombies += 1
	emit_signal("zcountsignal")
	
