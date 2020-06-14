extends Node


func _ready():
	get_node("/root/game").connect("game_timer_updated", self, "_on_update_game_time")

func _on_update_game_time(time):
	if(Singletons.gameState == Singletons.gameStates.Running):
		var time_string = str(time)
		if time < 10:
			time_string = "0" + time_string
		self.text = "Time: " + time_string
