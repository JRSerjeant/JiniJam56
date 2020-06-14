extends Node


var timer = Timer.new()
signal game_timer_updated
var StartingGameTime = 0
var CurrentGameTime = StartingGameTime

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(timer)
	timer.connect("timeout",self,"_update_game_time")
	timer.start()

func _input(event):
	if(event.is_action_pressed("pause") && Singletons.gameState == Singletons.gameStates.Welcome):
		print("Styarting game from welcome")
		Singletons.gameState = Singletons.gameStates.Running
	elif(event.is_action_pressed("pause") && Singletons.gameState == Singletons.gameStates.Paused):
		print("Staring game from pause")
		Singletons.gameState = Singletons.gameStates.Running
	elif(event.is_action_pressed("pause") && Singletons.gameState == Singletons.gameStates.Running):
		print("Pasuing game")
		Singletons.gameState = Singletons.gameStates.Paused
	elif(event.is_action_pressed("restart") && Singletons.gameState == Singletons.gameStates.GameOver):
		print("restarting game")
		emit_signal("game_timer_updated",CurrentGameTime)
		StartingGameTime = 0
		CurrentGameTime = 0
		get_node("donut").restart()
		Singletons.gameState = Singletons.gameStates.Welcome

func _update_game_time():
	if(Singletons.gameState == Singletons.gameStates.Running):
		CurrentGameTime = CurrentGameTime + 1
		#print("Updating time!! " + str(CurrentGameTime)
		emit_signal("game_timer_updated",CurrentGameTime)
		print("Update time: " + str(CurrentGameTime))
