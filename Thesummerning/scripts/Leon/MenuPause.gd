extends Control

func _physics_process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().paused = !get_tree().paused
		$".".visible = get_tree().paused
