extends Node

var ant_scene = load("res://ant/ant.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	print("This is the name manager")
	var spawn_points = get_node("spawn_points")
	AddAnt(spawn_points)


#func _process(delta):
#	pass

func AddAnt(spawn_points):
	var new_ant : Node2D = ant_scene.instance()
	var index = rng.randi_range(0, spawn_points.get_child_count() -1)
	#var index = 0
	
	print(spawn_points.get_child(index))
	new_ant.position = spawn_points.get_child(index).position
	add_child(new_ant)
	#for point in spawn_points.get_children():
	#	print(point)
