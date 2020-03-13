extends Timer
func _ready():
	var sometime = RandomNumberGenerator.new()
	sometime.randomize()
	var somepoint = sometime.randi_range(20,30)
	set_wait_time(rand_range(20, somepoint))
	connect('timeout', self, 'RottingZombie')	
	start()
	

