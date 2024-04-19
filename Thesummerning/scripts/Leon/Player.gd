extends CharacterBody3D

@export var speed : float
@export var jumpForce = 400.0

@export var springRef : NodePath
@onready var spring = get_node(springRef)

@export var hudRef : NodePath
@onready var hud = get_node(hudRef)
@onready var anim := $AnimatedSprite3D
@onready var gravityVector = ProjectSettings.get_setting("physics/3d/default_gravity_vector")
@onready var walkInputs := Vector2.ZERO
@onready var direction := Vector3.ZERO
@onready var moveDirection := Vector3.ZERO
@onready var fallDirection := Vector3.ZERO

@onready var collider := $CollisionShape3D
@onready var col = KinematicCollision3D
@onready var rayhitInfo
@export var LIFE : float
func _physics_process(delta):
	GravitySystem(delta)
	Walk(delta)
	GetCollisions()
	AnimatorController()
	velocity = direction + fallDirection
	move_and_slide()
func GravitySystem(DELTA:float):
	if !is_on_floor():
		fallDirection += gravityVector * 100 * DELTA
	else: fallDirection = -get_floor_normal()
func LookAtSystem():
	if Input.is_action_pressed("shoot") && !rayhitInfo.is_empty():
		var pos = Vector3(rayhitInfo.position.x,global_position.y,rayhitInfo.position.z)
		$MeshInstance3D2.look_at(pos,Vector3.UP)
	else:
		if(direction.length()!=0):
			$MeshInstance3D2.look_at(position+direction)
func Walk(DELTA:float):
	walkInputs = Input.get_vector("left","right","forward","back").normalized()
	direction = Vector3(walkInputs.x,0,walkInputs.y).normalized()
	direction = direction.rotated(Vector3.UP,spring.rotation.y).normalized()
	direction.x = lerp(direction.x,direction.x*speed*DELTA,10*DELTA)
	direction.z = lerp(direction.z,direction.z*speed*DELTA,10*DELTA)
func AnimatorController():
	if walkInputs.x > 0.2 :
		anim.flip_h = false
	if walkInputs.x < -0.2:
		anim.flip_h = true
	if walkInputs.length() != 0.0:
		anim.play("run")
	else:anim.stop()
#func Jump(DELTA:float):
	#if Input.is_action_just_pressed("jump") && is_on_floor():
		#fallDirection += transform.basis.y*jumpForce*DELTA
		#await get_tree().create_timer(0.5).timeout
		#if Input.is_action_pressed("jump") && !is_on_floor():
			#fallDirection  -= gravityVector * 100 * DELTA
	#if Input.is_action_just_released("jump") && !is_on_floor():
		#fallDirection -= gravityVector * 100 * DELTA
func GetCollisions():
	for i in get_slide_collision_count():
		col = get_slide_collision(i)
		col.get_collider()
		PushRbodys()
func PushRbodys():
	if col.get_collider() is RigidBody3D:
		if is_on_wall() && col.get_collider().gravity_scale>0.5:
			col.get_collider().apply_central_impulse(-col.get_normal()*(col.get_collider().mass))
func FeedHUDValues():
	if hud.index <= hud.bars.size()-1:
		hud.bars[hud.index].value = hud.bars[hud.index].max_value
		hud.index += 1
func FeedLifeValue(value:int):
	pass
func TakeDamage(dmg:int):
	if LIFE > 0:
		LIFE -= dmg
		print(name,LIFE)
	else:
		Death()
func Death():
	queue_free()
