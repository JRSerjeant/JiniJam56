extends Node

var dropper
var peper_Progressbar : ProgressBar
var cayenne_Progressbar : ProgressBar

var bar_reduce_ammount = Singletons.bar_reduce_ammount
func _ready():
	dropper = get_node("/root/game/dropper")
	peper_Progressbar = get_node("/root/game/peper_ProgressBar")
	cayenne_Progressbar = get_node("/root/game/cayenne_ProgressBar")

func _process(delta):
	if(Singletons.gameState == Singletons.gameStates.GameOver):
		peper_Progressbar.value = 100
		cayenne_Progressbar.value = 100

func _pressed():
	if(Singletons.gameState == Singletons.gameStates.Running):
		var currenttexture = dropper.get_node("Sprite").texture
		if(currenttexture != self.icon):
			dropper.get_node("Sprite").texture = self.icon
			dropper.switch_progress_bar()
		if(currenttexture == self.icon):
			dropper.increase_progress_bar()
		
func _on_pepper_button_mouse_entered():
	Singletons.allow_drop = false

func _on_pepper_button_mouse_exited():
	Singletons.allow_drop = true

func _on_cayenne_button_mouse_entered():
	Singletons.allow_drop = false

func _on_cayenne_button_mouse_exited():
	Singletons.allow_drop = true
