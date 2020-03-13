extends Timer
func _ready():
	set_wait_time(.2)
	connect('timeout', self, 'GreenShortsZombie')	
	start()
