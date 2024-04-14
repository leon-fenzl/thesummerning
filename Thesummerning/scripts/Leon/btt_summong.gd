extends Button

@export var styleType : Texture2D
@export var sceneType : PackedScene
@onready var spawnScene : Node

@export var spawnerRef : NodePath
@onready var spawner = get_node(spawnerRef)
@onready var spawned :=false
func _on_button_down():
	icon = styleType
	if spawned == false:
		spawner.SpawnAlly(sceneType)
		spawned = true
func _on_button_up():
	pass # Replace with function body.
