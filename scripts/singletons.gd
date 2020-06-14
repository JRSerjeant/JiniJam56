extends Node


var allow_drop : bool = true
var bar_reduce_ammount = 10
var donut
var game_scene
var rng = RandomNumberGenerator.new()
var gameState = "Running"
# Called when the node enters the scene tree for the first time.
func _ready():
	donut = get_node("/root/game/donut")
	game_scene = get_node("/root/game/drops")
	print(donut)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(gameState == "GameOver"):
		print(gameState)
