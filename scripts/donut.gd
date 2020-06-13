extends Node


var amout_remaining = 0.05
var reduction_per_bite = 0.002
var amplitude = 250
var allow_eat : bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	$donut.scale = Vector2(amout_remaining,amout_remaining)
	if($donut.scale.x <= 0.0 && $donut.scale.y <= 0.0):
		allow_eat = false
		Singletons.gameState = "GameOver"

func eat():
	if(allow_eat):
		print("Being Eatten!")
		var rand = Vector2()
		rand.x = rand_range(-amplitude,amplitude)
		rand.y = rand_range(-amplitude,amplitude)
		amout_remaining = amout_remaining - reduction_per_bite
		$donut/eating_tween.interpolate_property($donut, "offset", $donut.offset, rand, 0.1,Tween.TRANS_SINE, Tween.EASE_IN)
		$donut/eating_tween.start()
