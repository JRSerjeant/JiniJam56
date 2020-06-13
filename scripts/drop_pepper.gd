extends KinematicBody2D

var drop_type = ""
var life_time = 3
export var cayenne : Texture

func _ready():
	$life_timer.wait_time = life_time
	$life_timer.connect("timeout",self,"queue_free")
	if(drop_type == "cayenne"):
		$Sprite.texture = cayenne
		self.set_collision_layer_bit(1,false)
		self.set_collision_layer_bit(2,true)
		
func kill():
	$life_timer.start()
