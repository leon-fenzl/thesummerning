extends CharacterBody3D
class_name BaseAI

enum AI_TYPES {GUARD,MOB}
enum MOVE_TYPES{WALK,ATK,DEAD}

@export var SPEED := 500.0
@export var life : float
@export var targetTag : String
@export var damage : int
@export var baseType = AI_TYPES.GUARD
@onready var moveState = MOVE_TYPES.WALK

@onready var damageCtrl := $DealDmg
@onready var agent := $NavigationAgent3D
@onready var anim := $AnimatedSprite3D

@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var current_location := Vector3.ZERO
@onready var next_location := Vector3.ZERO
@onready var new_direction := Vector3.ZERO

@onready var target : Node3D

func CalcualteDirection(d:float):
	current_location = global_transform.origin
	next_location = agent.get_next_path_position()
	new_direction = (next_location - current_location).normalized() * SPEED * d
func WALK():
	velocity = new_direction
	move_and_slide()
func Update_target_location(location:Vector3):
	agent.set_target_position(location)
func GravitySystem(DELTA:float):
	if !is_on_floor():
		gravityVector *= 100 * DELTA
	else: gravityVector = -get_floor_normal()
func _on_location_timer_timeout():
	if target != null:
		Update_target_location(target.global_position)
func ATTACK(body:Node=null):
	pass
func TakeDamage(dmg:int):
	if life > 0:
		life -= dmg
		print(life)
	else:
		Death()
func Death():
	free()
