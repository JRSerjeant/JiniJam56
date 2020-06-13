extends KinematicBody2D


export var red_head : Texture
export var red_neck1 : Texture
export var red_neck2 : Texture
export var red_stomach : Texture
var runs_away_from = "pepper"
var donut : Node2D = Singletons.donut
var speed = 0.1
var exit_speed = 0.6
var bites_taken = 0
var total_bites_allowed = 3
var vel = Vector2()
var isRed : bool = false
enum states{
	walkingIn,
	runningAway,
	eating,
	GameOver
}

var state = states.walkingIn
var spawn_location : Vector2
var rng : RandomNumberGenerator = Singletons.rng

# Called when the node enters the scene tree for the first time.
func _ready():
	if(isRed):
		self.set_collision_mask_bit(1,false)
		self.set_collision_mask_bit(2,true)
		get_node("Node2D/Head/head").texture = red_head
		get_node("Node2D/Body/neck1").texture = red_neck1
		get_node("Node2D/Body/neck2").texture = red_neck2
		get_node("Node2D/Body/stomach").texture = red_stomach
		runs_away_from = "cayenne"
	look_at(donut.position)
	vel = (donut.position - position) * speed
	$eating_timer.connect("timeout", self, "eat_donut")

func _process(delta):
	if(Singletons.gameState == "GameOver" && state != states.GameOver):
		change_state(states.GameOver, state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match state:
		states.walkingIn:
			var collide = move_and_collide(vel * delta)
			if collide && collide.collider.get("drop_type") && collide.collider.drop_type == runs_away_from:
				collide.collider.kill()
				change_state(states.runningAway, state)
			if collide && collide.collider.name == "donut_collider":
				change_state(states.eating, state)
		states.runningAway:
			var collide = move_and_collide(vel * delta)
			if not get_node("notifier").is_on_screen():
				queue_free()
		states.eating:
			if(bites_taken == total_bites_allowed):
					change_state(states.runningAway,state)
			if($eating_timer.is_stopped()):
				if(bites_taken < total_bites_allowed):
					bites_taken = bites_taken + 1
					print(bites_taken)
					$eating_timer.start()

func change_state(newState, currentState):
	# Exit current state
	match currentState:
		states.walkingIn:
			speed = 0
		states.eating:
			$eating_timer.stop()
	# Enter new satet
	match newState:
		states.runningAway:
			$CollisionShape2D.disabled = true
			var exit_location = Vector2(spawn_location.x, spawn_location.y)
			look_at(exit_location)
			vel = (exit_location- position) * exit_speed
		states.eating:
			$CollisionShape2D.disabled = true
			print("Now Eating")
		states.GameOver:
			print("Game is over stop any actions")
	state = newState

func eat_donut():
	donut.eat()
