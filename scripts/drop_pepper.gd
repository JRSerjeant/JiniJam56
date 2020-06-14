extends KinematicBody2D

var drop_type = ""
var long_life_time = 15
var short_life_time = 3
export var cayenne : Texture

func _ready():
	$life_timer.wait_time = long_life_time
	$life_timer.connect("timeout",self,"queue_free")
	$life_timer.start()
	if(drop_type == "cayenne"):
		$Sprite.texture = cayenne
		self.set_collision_layer_bit(1,false)
		self.set_collision_layer_bit(2,true)

func kill():
	$life_timer.stop()
	$life_timer.wait_time = short_life_time
	$life_timer.start()
