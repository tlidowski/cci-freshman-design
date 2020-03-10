extends Timer
func _ready():
	set_wait_time(20)
	connect('timeout', self, 'HeadlessZombie')	
	start()
