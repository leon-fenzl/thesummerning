extends Node

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().paused = !get_tree().paused
