extends Camera3D

@export var displace_Height:float
@export var minLength:float
@export var maxLength:float
@export var pitch := Vector2(-80.0,80.0)
@export var yaw := Vector2(0.0,360.0)
@onready var camInputs := Vector2.ZERO
@onready var parent:=$".."

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y*parent.mouseSpeed*get_physics_process_delta_time()
		rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
		rotation.y -= event.relative.x*parent.mouseSpeed*get_physics_process_delta_time()
		rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
func _physics_process(delta: float) -> void:
	Controller_Inputs()
	Ctrlr_Pitch_Yaw(delta)
func Controller_Inputs()-> void:
	camInputs = Input.get_vector("camLeft","camRight","camUp","camDown").normalized()
func Ctrlr_Pitch_Yaw(DELTA:float)-> void:
	rotation.x -= camInputs.y*parent.controllerSpeed*DELTA
	rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
	rotation.y -= camInputs.x*parent.controllerSpeed*DELTA
	rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
#
#@export var playerRef : NodePath
#@onready var player = get_node(playerRef)
#@onready var pauseScreen := $"../UI/PauseMenu/ColorRect"
#@onready var btt_Resume := $"../UI/PauseMenu/Btt_Resume"
#@onready var btt_Restart := $"../UI/PauseMenu/Btt_Restart"
#@onready var btt_Options := $"../UI/PauseMenu/Btt_Options"
#@onready var btt_Back := $"../UI/PauseMenu/Btt_Menu"
#@onready var gameScene:=load("res://Scenes/GameScenes/Main.tscn")
#@onready var menuScene:=load("res://Scenes/GameScenes/Menu.tscn")
#func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#func _physics_process(delta):
	#if Input.is_action_just_pressed("exit"):
		#Pause_Screen_Visbility()
#func Pause_Screen_Visbility():
	#pauseScreen.visible = !pauseScreen.visible
	#btt_Resume.visible = pauseScreen.visible
	#btt_Restart.visible = pauseScreen.visible
	#btt_Options.visible = pauseScreen.visible
	#btt_Back.visible = pauseScreen.visible
	#get_tree().paused = !get_tree().paused
	#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#func Unpause_Screen_Visbility():
	#pauseScreen.visible = !pauseScreen.visible
	#btt_Resume.visible = pauseScreen.visible
	#btt_Restart.visible = pauseScreen.visible
	#btt_Options.visible = pauseScreen.visible
	#btt_Back.visible = pauseScreen.visible
	#get_tree().paused = !get_tree().paused
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#func _on_btt_resume_pressed():
	#Unpause_Screen_Visbility()
#func _on_btt_restart_pressed():
	#get_tree().change_scene_to_packed(gameScene)
	#get_tree().paused = !get_tree().paused
#func _on_btt_menu_pressed():
	#get_tree().change_scene_to_packed(menuScene)
	#get_tree().paused = !get_tree().paused
#func Dead_Screen_Visbility():
	#pauseScreen.visible = !pauseScreen.visible
	#btt_Restart.visible = pauseScreen.visible
	#btt_Options.visible = pauseScreen.visible
	#btt_Back.visible = pauseScreen.visible
	#get_tree().paused = !get_tree().paused
	#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#func _on_btt_options_pressed():
	#pass # Replace with function body.
	#
