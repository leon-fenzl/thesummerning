extends CharacterBody3D

@export var speed = 300.0
@export var jumpForce = 400.0
@export var mouseSpeed:float
@export var controllerSpeed:float

@onready var camera = Camera3D
@export var springRef : NodePath
@onready var spring = get_node(springRef)

@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity_vector")
@onready var walkInputs := Vector2.ZERO
@onready var direction := Vector3.ZERO
@onready var moveDirection := Vector3.ZERO
@onready var fallDirection := Vector3.ZERO

@onready var collider := $CollisionShape3D
@onready var col = KinematicCollision3D

func _physics_process(delta):
	GravitySystem(delta)
	Walk(delta)
	Jump(delta)
	GetCollisions()
	velocity = (direction*speed*delta) + fallDirection
	move_and_slide()
func GravitySystem(DELTA:float):
	if !is_on_floor():
		fallDirection += gravityVector * 10 * DELTA
	else: fallDirection = -get_floor_normal()
func LookAtSystem():
	var world = get_world_3d().direct_space_state
	var mousepos = get_viewport().get_mouse_position()
	var rayOrigin = $SpringArm3D/Camera3D.project_ray_origin(mousepos)
	var rayEnd = rayOrigin + $SpringArm3D/Camera3D.project_position(mousepos,1000)
	var rayhitInfo = world.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd))
	if Input.is_action_pressed("shoot") && !rayhitInfo.is_empty():
		var pos = Vector3(rayhitInfo.position.x,global_position.y,rayhitInfo.position.z)
		$MeshInstance3D2.look_at(pos,Vector3.UP)
	else:
		if(direction.length()!=0):
			$MeshInstance3D2.look_at(position+direction)
func Walk(DELTA:float):
	walkInputs = Input.get_vector("left","right","forward","back")
	direction = Vector3(walkInputs.x,0,walkInputs.y).normalized()
	direction = direction.rotated(Vector3.UP,spring.rotation.y).normalized()
	LookAtSystem()
	direction.x = lerp(direction.x,direction.x*speed*DELTA,10*DELTA)
	direction.z = lerp(direction.z,direction.z*speed*DELTA,10*DELTA)
func Jump(DELTA:float):
	if Input.is_action_just_pressed("jump") && is_on_floor():
		fallDirection += transform.basis.y * jumpForce*DELTA
		await get_tree().create_timer(0.25).timeout
		if Input.is_action_pressed("jump") && !is_on_floor():
			fallDirection += gravityVector * 10 * DELTA
	if Input.is_action_just_released("jump") && !is_on_floor():
		fallDirection += gravityVector * 10 * DELTA
func GetCollisions():
	for i in get_slide_collision_count():
		col = get_slide_collision(i)
		col.get_collider()
		PushRbodys()
func PushRbodys():
	if col.get_collider() is RigidBody3D:
		if is_on_wall() && col.get_collider().gravity_scale>0.5:
			col.get_collider().apply_central_impulse(-col.get_normal()*(col.get_collider().mass))