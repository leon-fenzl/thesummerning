extends SpringArm3D

@export var playerRef : NodePath
@onready var player = get_node(playerRef)

@onready var camera := $GameCamera
@onready var queryDictionary : Dictionary

@onready var world
@onready var mousepos
@onready var rayOrigin 
@onready var rayEnd
@onready var query

func _ready():
	set_as_top_level(true)
func _physics_process(delta):
	if player != null:
		position = lerp(position,player.global_position,10*delta)
		DrawRaycast()
		player.rayhitInfo = queryDictionary
func DrawRaycast():
	world = get_world_3d().direct_space_state
	mousepos = get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mousepos)
	rayEnd = rayOrigin + camera.project_position(mousepos,1000)
	query = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd)
	queryDictionary = world.intersect_ray(query)
