extends Node

var ant_scene = load("res://ant/ant.tscn")
var rng : RandomNumberGenerator = Singletons.rng
var ant_ducket
var ready_spawn_amount = 3
var total_ants_allowed = 7
var spawn_rate = 3
var spawn_points

func _ready():
	$spawn_timer.wait_time = spawn_rate
	$spawn_timer.connect("timeout", self, "AddAnt")
	spawn_points = get_node("spawn_points")
	ant_ducket = get_node("ants")
	for a in ready_spawn_amount:
		AddAnt()
	$spawn_timer.start()


func _process(delta):
	if($spawn_timer.is_stopped()):
		#print("timeer is stopped")
		print(total_ants_allowed)
		print($ants.get_child_count())
		if($ants.get_child_count() <= total_ants_allowed):
			print("Staring spwn timer")
			$spawn_timer.start()

func AddAnt():
	print("Adding ant")
	var new_ant : Node2D = ant_scene.instance()
	var index = rng.randi_range(0, spawn_points.get_child_count() -1)	
	print(spawn_points.get_child(index))
	new_ant.position = spawn_points.get_child(index).position
	new_ant.spawn_location = spawn_points.get_child(index).position
	ant_ducket.add_child(new_ant)
	
