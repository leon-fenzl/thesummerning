extends Node3D

@onready var spawnScene : Node
@export var playerRef : NodePath
@onready var player = get_node(playerRef)
@export var spawnPoss:Array[Node3D]
@onready var index := 0
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	position = lerp(position, Vector3(player.position.x,0,player.position.z)+Vector3.UP,10*delta)
func SpawnAlly(sceneType : PackedScene):
	if index <=spawnPoss.size()-1:
		print(index)
		print(spawnPoss[index])
		if spawnPoss[index].ocupied == false:
			spawnScene = sceneType.instantiate()
			spawnScene.visible = false
			add_child(spawnScene)
			spawnScene.global_transform.origin = Vector3(spawnPoss[index].position.x, 1, spawnPoss[index].position.z)
			spawnScene.visible = true
			spawnPoss[index].ocupied = true
		else:
			index += 1
	else:
		index = 0
