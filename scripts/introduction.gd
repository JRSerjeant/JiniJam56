extends Node


var welcome_text = "Welcome to Donut vs Ants vs Pepper, \n\nUse the Black and Cayenne Pepper to stop the ants from eating your donut. \nUse the buttons on the left and right to switch between Black and Cayenne Pepper and to refill the pepper mill when it runs low. Once the ants are eating the donut they will not be bothered by the pepper. \nLast as long as you can. \n\n\nPress P to start or resume."
var pause_text = "\n\n\n\n\n\n\n\nPress P to pause."
var gameover_text = "Game Over\nWell done you survived for {seconds} seconds. \n\n\n\n\nPress R to restart. "
var game
# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_node("/root/game")
	self.text = welcome_text



func _process(delta):
	if(Singletons.gameState == Singletons.gameStates.Welcome):
		self.text = welcome_text
	if(Singletons.gameState == Singletons.gameStates.Running):
		self.text = pause_text
	elif(Singletons.gameState == Singletons.gameStates.Paused):
		self.text = welcome_text
	elif(Singletons.gameState == Singletons.gameStates.GameOver):
		self.text = gameover_text.replace("{seconds}", game.CurrentGameTime)
		
