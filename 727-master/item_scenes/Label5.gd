#Name: Label5
#Purpose: Displays number of gems collected and number of zombies killed.
#Version/Date: 1.0 - 8 June 2020
#Author(s): Adrienne C
#Dependencies: GlobalVars

extends Label

func _ready():
	GlobalVars.connect("zombiesignal", self, "_ready")
	GlobalVars.connect("gemsignal", self, "_ready")
	GlobalVars.connect("zcountsignal", self, "_ready")
	self.set_text("Gems Collected: {0}/{2}\nZombies Killed: {1}".format({"0": str(int(GlobalVars.gem_count)), "1":str(int(GlobalVars.zombie_kills)), "2":str(int(GlobalVars.zombies))}))
