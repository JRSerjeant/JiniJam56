extends Node2D


var pepper_scene = load("res://dropper/drop_pepper.tscn")
var pepper_drop_point
var currnet_drop
var currnet_drop_point : Node2D 



func _ready():
	pepper_drop_point = get_node("pepper_drop_point")
	currnet_drop_point = pepper_drop_point
	currnet_drop = pepper_scene

func _process(delta):
	position = get_global_mouse_position()
	
func _input(event):
	if event.is_action_pressed("drop"):
		var new_drop : Node2D = currnet_drop.instance()
		new_drop.position = currnet_drop_point.global_position
		new_drop.drop_type = "pepper"
		Singletons.game_scene.add_child(new_drop)

