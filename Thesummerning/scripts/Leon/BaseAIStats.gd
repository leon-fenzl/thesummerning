extends CharacterBody3D
class_name BaseAI
enum STATES{WALK,ATK,DEAD}

@export var SPEED := 500.0
@export var LIFE := 0
@onready var lifeCtrl := $CompLife
@onready var damageCtrl := $CompDamage
@onready var agent := $NavigationAgent3D
@onready var state = STATES.WALK

@onready var current_location := Vector3.ZERO
@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	LIFE = lifeCtrl.life

func _physics_process(delta):
	GravitySystem(delta)
	
	match state:
		STATES.WALK:
		if(!arrived):
			var current_location = global_transform.origin
			var next_location = nav_agent.get_next_path_position()
			var new_velocity = (next_location - current_location).normalized() * SPEED
			WALK()
		STATES.ATK:
			ATTACK()
func WALK():
	
		velocity = velocity.move_toward(new_velocity, .25)
		move_and_slide()
func ATTACK():
	pass
func GravitySystem(DELTA:float):
	if !is_on_floor():
		gravityVector *= 100 * DELTA
	else: gravityVector = -get_floor_normal()
func Calcula
