extends CharacterBody3D
class_name GuardaCostasB

@export var SPEED = 5.0
@export var DAMAGE = 1

var acell = 10

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

var arrived = false

var EnemyArray

var enemypos

func _ready():
	pass
	
func _process(delta):
	pass

func _physics_process(delta):
	NextEnemy()
	if(!arrived):
		var current_location = global_transform.origin
		var next_location = nav_agent.get_next_path_position()
		var new_velocity = (next_location - current_location).normalized() * SPEED
		velocity = velocity.move_toward(new_velocity, .25)
		move_and_slide()
	
func update_target_location(target_location):
	nav_agent.set_target_position(target_location)

func chegou():
	
	pass # Replace with function body.
	
func NextEnemy():
	EnemyArray = get_tree().get_nodes_in_group("enemy").pick_random()
	var pos = EnemyArray.global_position
	if(EnemyArray.position != Vector3(0,0,0)):
		nav_agent.target_position = pos
