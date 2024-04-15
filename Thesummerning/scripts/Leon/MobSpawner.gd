extends Node3D

@export var mobScenes:Array[PackedScene]
@onready var index := 0
@onready var mobNode : Node3D
# Called when the node enters the scene tree for the first time.
func _ready():
	SpawnRandomAI()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func SpawnRandomAI():
	load(mobScenes[index].get_path())
	mobNode = mobScenes[index].instantiate()
	add_child(mobNode)
	mobNode.set_as_top_level(true)
	if index <= mobScenes.size()-1:index = 0
	else: index += 1
func _on_timer_timeout():
	SpawnRandomAI()
