extends Button

@export var styleType : Texture2D
@export var sceneType : PackedScene
@onready var spawnScene : Node
@onready var onDrag:bool = false
@onready var cam:Camera3D
@export var targetingRef : NodePath
@onready var targeting = get_node(targetingRef)
@onready var query
@onready var dictionary :Dictionary
# worldObjectCollision
@onready var rayCol : CollisionObject3D
func _ready():
	icon = styleType
func _physics_process(delta):
	DragOn()
func DragOn():
	if onDrag == true:
		query = targeting.query
		query.collide_with_areas = true
		dictionary = targeting.queryDictionary
		if !dictionary.is_empty():
			spawnScene.position = Vector3(dictionary.position.x, 1, dictionary.position.z)
			spawnScene.visible = true
			spawnScene.global_position
		else:
			spawnScene.visible = false
func SpawnAlly():
	spawnScene = sceneType.instantiate()
	add_child(spawnScene)
	spawnScene.visible = false
func _on_button_down():
	onDrag = true
	SpawnAlly()
func _on_button_up():
	onDrag = false
	print("up")
