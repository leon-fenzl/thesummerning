extends SpringArm3D

@export var displace_Height:float
@export var minLength:float
@export var maxLength:float
@export var pitch := Vector2(-80.0,80.0)
@export var yaw := Vector2(0.0,360.0)
@onready var camInputs := Vector2.ZERO
@onready var parent:=$".."

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#rotation.x -= event.relative.y*parent.mouseSpeed*get_physics_process_delta_time()
		#rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
		rotation.y -= event.relative.x*parent.mouseSpeed*get_physics_process_delta_time()
		rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
func _physics_process(delta: float) -> void:
	Controller_Inputs()
	Ctrlr_Pitch_Yaw(delta)
func Controller_Inputs()-> void:
	camInputs = Input.get_vector("camLeft","camRight","camUp","camDown").normalized()
func Ctrlr_Pitch_Yaw(DELTA:float)-> void:
	#rotation.x -= camInputs.y*parent.controllerSpeed*DELTA
	#rotation.x = clamp(rotation.x,deg_to_rad(pitch.x),deg_to_rad(pitch.y))
	rotation.y -= camInputs.x*parent.controllerSpeed*DELTA
	rotation.y = wrapf(rotation.y,deg_to_rad(yaw.x),deg_to_rad(yaw.y))
