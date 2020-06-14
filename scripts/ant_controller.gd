extends Node

var game
var ant_scene = load("res://ant/ant.tscn")
var rng : RandomNumberGenerator = Singletons.rng
var ant_ducket
var ready_spawn_amount = 3
var total_ants_allowed = 20
var spawn_amout = 1
var spawn_rate = 4
var spawn_points
var initail_spawn_done : bool = false
func _ready():
	$spawn_timer.wait_time = spawn_rate
	$spawn_timer.connect("timeout", self, "AddAnt")
	spawn_points = get_node("spawn_points")
	ant_ducket = get_node("ants")
	game = get_node("/root/game")


func _process(delta):
	match game.CurrentGameTime:
		20:
			total_ants_allowed = 25
			spawn_amout = 2
			spawn_rate = 4
		35:
			total_ants_allowed = 30
			spawn_amout = 2
			spawn_rate = 2
		40:
			total_ants_allowed = 40
			spawn_amout = 4
			spawn_rate = 1
	if(Singletons.gameState == Singletons.gameStates.Welcome):
		kill_all_ants()
		ready_spawn_amount = 3
		total_ants_allowed = 20
		spawn_amout = 1
		spawn_rate = 4
		initail_spawn_done = false
	if(Singletons.gameState == Singletons.gameStates.Running):
		if(initail_spawn_done == false):
			for a in ready_spawn_amount:
				AddAnt()
			$spawn_timer.start()
			initail_spawn_done = true
	
		if($spawn_timer.is_stopped()):
			print(total_ants_allowed)
			print($ants.get_child_count())
			if($ants.get_child_count() <= total_ants_allowed):
				$spawn_timer.start()

func AddAnt():
	for a in spawn_amout:
		var new_ant : Node2D = ant_scene.instance()
		var index = rng.randi_range(0, spawn_points.get_child_count() -1)	
		print(spawn_points.get_child(index))
		new_ant.isRed = rng.randi_range(0,1)
		new_ant.position = spawn_points.get_child(index).position
		new_ant.spawn_location = spawn_points.get_child(index).position
		ant_ducket.add_child(new_ant)
	
func kill_all_ants():
	for ant in $ants.get_children():
		ant.queue_free()
