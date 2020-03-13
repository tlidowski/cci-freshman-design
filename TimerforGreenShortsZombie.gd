extends Timer
func _ready():
	var sometime = RandomNumberGenerator.new()
	sometime.randomize()
	var somepoint = sometime.randi_range(10, 20)
	set_wait_time(rand_range(5, somepoint))
	connect('timeout', self, 'GreenShortsZombie')	
	start()
