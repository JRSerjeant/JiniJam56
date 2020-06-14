extends Node2D


var pepper_scene = load("res://dropper/drop_pepper.tscn")
var pepper_drop_point
var currnet_drop
var currnet_drop_point : Node2D 
export var peper_black : Texture
export var peper_red : Texture
var peper_Progressbar : ProgressBar
var cayanne_Progressbar : ProgressBar
var current_Progressbar : ProgressBar
var bar_reduce_ammount = Singletons.bar_reduce_ammount

func _ready():
	peper_Progressbar = get_node("/root/game/peper_ProgressBar")
	cayanne_Progressbar = get_node("/root/game/cayenne_ProgressBar")
	pepper_drop_point = get_node("pepper_drop_point")
	current_Progressbar = peper_Progressbar
	currnet_drop_point = pepper_drop_point
	currnet_drop = pepper_scene

func _process(delta):
	position = get_global_mouse_position()
	
func _input(event):
	if event.is_action_pressed("drop") && Singletons.allow_drop && Singletons.gameState == Singletons.gameStates.Running:
		var new_drop : Node2D = currnet_drop.instance()
		new_drop.position = currnet_drop_point.global_position
		if(current_Progressbar.value > 0):
			if($Sprite.texture == peper_black):
				new_drop.drop_type = "pepper"
			else:
				new_drop.drop_type = "cayenne"
				
			current_Progressbar.value = current_Progressbar.value - bar_reduce_ammount
			Singletons.game_scene.add_child(new_drop)

func switch_progress_bar():
	var new_ProgressBar
	match current_Progressbar:
		peper_Progressbar:
			new_ProgressBar = cayanne_Progressbar
		cayanne_Progressbar:
			new_ProgressBar = peper_Progressbar
	current_Progressbar = new_ProgressBar

func increase_progress_bar():
	current_Progressbar.value = current_Progressbar.value + bar_reduce_ammount
