extends Node

#@export var player = Node3D

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get_tree().call_group("enemy","update_target_location", player.global_transform.origin)
	pass
	
func _physics_process(delta):
	get_tree().call_group("enemy","update_target_location", player.global_transform.origin)
