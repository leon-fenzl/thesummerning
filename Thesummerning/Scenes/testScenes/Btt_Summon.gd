extends Button

@export var styleType : Texture2D
@export var sceneType : PackedScene
@onready var spawnScene : Node
@onready var onDrag:bool = false
@onready var cam:Camera3D
@export var targetingRef : NodePath
@onready var targeting = get_node(targetingRef)
func _ready():
	icon = styleType
	spawnScene = sceneType.instantiate()
	add_child(spawnScene)
	cam = get_viewport().get_camera_3d()
	print(cam.name)
func _physics_process(delta):
	pass
func DragOn():
	pass
func SpawnAlly():
	pass
func _on_button_down():
	onDrag = true
func _on_button_up():
	if onDrag == true:
		onDrag = false
