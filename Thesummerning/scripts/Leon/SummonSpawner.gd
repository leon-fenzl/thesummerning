extends Node3D

@onready var spawnScene : Node
@export var playerRef : NodePath
@onready var player = get_node(playerRef)
@export var spawnPoss:Array[Node3D]
@onready var index := 0
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	position = lerp(position, Vector3(player.global_position.x,position.y,player.global_position.z),10*delta)
func SpawnAlly(sceneType : PackedScene):
	spawnScene = sceneType.instantiate()
	add_child(spawnScene)
	if spawnPoss[index]
	spawnScene.position = Vector3()
