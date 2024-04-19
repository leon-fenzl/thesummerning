extends Node3D
@export var playerRef : NodePath
@onready var player = get_node(playerRef)
@export var spawnPoss:Array[Marker3D]
@onready var spawnScene : Node
@onready var index := 0
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	rotation.y += 2*delta
	rotation.y = wrapf(rotation.y,deg_to_rad(0.0),deg_to_rad(360.0))
	if player != null:
		position = lerp(position, Vector3(player.position.x,0,player.position.z)+Vector3.UP,10*delta)
func SpawnAlly(sceneType: PackedScene):
	if index <= spawnPoss.size()-1 && spawnPoss[index].occupied == false:
		spawnScene = sceneType.instantiate()
		add_child(spawnScene)
		spawnScene.global_position = Vector3(spawnPoss[index].global_position.x, 1, spawnPoss[index].global_position.z)
		spawnScene.set_as_top_level(true)
		spawnScene.visible = true
		spawnScene.target = spawnPoss[index]
		spawnPoss[index].occupied = true
		index += 1
	else:
		index = 0

