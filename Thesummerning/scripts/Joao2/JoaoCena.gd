extends Node

#@export var player = Node3D

@onready var player = $Player

var Time_to_go = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Time_to_go <= 0):
		$Spawn.spawn()
		print("respawn")
		Time_to_go = 30
		$Timer.start()
	pass
	
	

func _physics_process(delta):
	get_tree().call_group("enemy","update_target_location", player.global_transform.origin)
	
	#get_tree().call_group("summer","update_target_location",)

func _on_timer_timeout():
	Time_to_go -=1
	$Timer.start()
	pass # Replace with function body.
