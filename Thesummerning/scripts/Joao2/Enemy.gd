extends CharacterBody3D


const SPEED = 2
const JUMP_VELOCITY = 4.5

var acell = 10

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

var arrived = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if(!arrived):
		var current_location = global_transform.origin
		var next_location = nav_agent.get_next_path_position()
		var new_velocity = (next_location - current_location).normalized() * SPEED
		velocity = velocity.move_toward(new_velocity, .25)
		move_and_slide()
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)


func chegou():
	print("chegou")
	arrived = true
	#print("chegou")
	pass # Replace with function body.
