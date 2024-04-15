extends CharacterBody3D
class_name BaseAI

enum AI_TYPES {GUARD,MOB}
enum MOVE_TYPES{WALK,ATK,DEAD}

@export var SPEED := 500.0
@export var LIFE := 0

@export var baseType = AI_TYPES.GUARD
@onready var moveState = MOVE_TYPES.WALK

@onready var lifeCtrl := $CompLife
@onready var damageCtrl := $CompDamage
@onready var agent := $NavigationAgent3D

@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var current_location := Vector3.ZERO
@onready var next_location := Vector3.ZERO
@onready var new_direction := Vector3.ZERO

@onready var target : Node3D
func _ready():
	LIFE = lifeCtrl.life
func _physics_process(delta):
	GravitySystem(delta)
	match moveState:
		MOVE_TYPES.WALK:
			current_location = global_transform.origin
			next_location = agent.get_next_path_position()
			new_direction = (next_location - current_location).normalized() * SPEED * delta
			WALK()
		MOVE_TYPES.ATK:
			ATTACK()
func WALK():
		velocity = new_direction
		move_and_slide()
func Update_target_location(location:Vector3):
	agent.set_target_position(location)
func ATTACK():
	pass
func GravitySystem(DELTA:float):
	if !is_on_floor():
		gravityVector *= 100 * DELTA
	else: gravityVector = -get_floor_normal()
func _on_timer_timeout():
	print(target.global_position)
	Update_target_location(target.global_position)
