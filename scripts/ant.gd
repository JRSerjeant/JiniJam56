extends KinematicBody2D


var donut : Node2D = Singletons.donut
var speed = 0.1
var vel = Vector2()
enum states{
  walkingIn,
  runningAway
}
var state = states.walkingIn

# Called when the node enters the scene tree for the first time.
func _ready():
	print(donut)
	look_at(donut.position)
	vel = (donut.position - position) * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match state:
		states.walkingIn:
			print("Walking In")
			var collide = move_and_collide(vel * delta)
			if collide:
				change_state(states.runningAway, state)
		states.runningAway:
			print("Running Away")
		

func change_state(newState, currentState):
	# Exit current state
	match currentState:
		states.walkingIn:
			speed = 0
	# Enter new satet
	match newState:
		states.runningAway:
			print("Start running away.")
	state = newState
	
	
	
