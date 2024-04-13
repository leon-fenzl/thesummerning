extends Node

#func _input(event):
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _physics_process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().paused = !get_tree().paused
		ShowMouseCursor()
func ShowMouseCursor():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func Unpause_Screen_Visbility():
	get_tree().paused = !get_tree().paused
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
