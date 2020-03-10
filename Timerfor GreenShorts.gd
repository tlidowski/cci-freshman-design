extends Timer

const period = 1000
var time = 0

func _ready():
	var sometime = RandomNumberGenerator.new()
	sometime.randomize()
	var somepoint = sometime.randi_range(1, 5)
	set_wait_time(rand_range(1, somepoint))
	connect('timeout', self, 'GreenShortsZombie')	
	start()
