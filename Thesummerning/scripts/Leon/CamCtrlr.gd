extends SpringArm3D

@onready var camera := $GameCamera
@export var playerRef : NodePath
@onready var player = get_node(playerRef)
@onready var world
@onready var mousepos
@onready var rayOrigin 
@onready var rayEnd
@onready var query
@onready var queryDictionary : Dictionary
func _physics_process(delta):
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
