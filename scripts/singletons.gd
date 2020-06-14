extends Node


var allow_drop : bool = true
var bar_reduce_ammount = 10
var donut
var game_scene
var rng = RandomNumberGenerator.new()
enum gameStates{
	Welcome,
	Running,
	Paused,
	GameOver
	}
var gameState = gameStates.Running
# Called when the node enters the scene tree for the first time.
func _ready():
	donut = get_node("/root/game/donut")
	game_scene = get_node("/root/game/drops")
	gameState = gameStates.Welcome


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(gameState == gameStates.GameOver):
		print(gameState)
