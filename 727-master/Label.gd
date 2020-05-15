extends Label

func _ready():
	
	GlobalVars.connect("gemsignal", self, "_count")
	
func _count():
	self.set_text("Gems Collected: {0}\nZombies Killed: {1}".format({"0": str(int(GlobalVars.gem_count)), "1":str(int(GlobalVars.zombie_kills))}))
