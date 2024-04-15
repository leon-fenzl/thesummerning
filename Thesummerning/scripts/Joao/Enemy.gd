extends CharacterBody3D
class_name EnemyC

@export var SPEED = 2.0
@export var DAMAGE = 1

var acell = 10

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

var arrived = false

var Target 

func _process(delta):
	pass

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
	arrived = true
	pass # Replace with function body.
	
