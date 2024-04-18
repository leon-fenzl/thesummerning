extends Node3D

@export var mobScenes:Array[PackedScene]
@onready var index : int
@onready var mobNode : Node3D
@export var playerRef:NodePath
@onready var player := get_node(playerRef)

@export var startTimer : float
@onready var currentTime : float
@onready var emitted := false
signal spawn

func _ready():
	index = 0
func _physics_process(delta):
	CustomTimer(delta)
func SpawnRandomAI():
	mobNode = mobScenes[index].instantiate()
	add_child(mobNode)
	print(mobNode.name)
	mobNode.target = player
	mobNode.set_as_top_level(true)
	if index >= mobScenes.size()-1:
		index = 0
	else:index += 1
func CustomTimer(d:float):
	currentTime -= 1 * d 
	if currentTime == startTimer/startTimer:
		emit_signal("spawn")
	if currentTime == startTimer/2:
		emit_signal("spawn")
	if currentTime <= startTimer - startTimer:
		emit_signal("spawn")
		ResetTimer()
func ResetTimer():
	currentTime = startTimer
func _on_spawn():
	SpawnRandomAI()

