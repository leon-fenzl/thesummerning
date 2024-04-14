extends Button

@export var styleType : Texture2D
@export var sceneType : PackedScene
@onready var spawned := false
@export var spawnerRef : NodePath
@onready var spawner = get_node(spawnerRef)
func _ready():
	icon = styleType
func _on_button_down():
	if spawned == false:
		spawner.SpawnAlly(sceneType)
		spawned = true
func _on_button_up():
	pass # Replace with function body.
