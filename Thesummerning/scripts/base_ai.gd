extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var moveDirection := Vector3.ZERO
@onready var suckDirection := Vector3.ZERO
@onready var fallDirection := Vector3.ZERO
@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity_vector")


func _physics_process(delta):
	velocity = moveDirection + suckDirection + fallDirection
	GravitySystem(delta)
	move_and_slide()
func GravitySystem(DELTA:float):
	if !is_on_floor():
		fallDirection += gravityVector * 10 * DELTA
	else: fallDirection = -get_floor_normal()
