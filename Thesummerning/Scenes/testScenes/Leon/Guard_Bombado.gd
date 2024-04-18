extends BaseAI

func _ready():
	pass
func _physics_process(delta):
	GravitySystem(delta)
	AnimatorController()
	match moveState:
		MOVE_TYPES.WALK:
			CalcualteDirection(delta)
			WALK()
		MOVE_TYPES.ATK:
			ATTACK()
func AnimatorController():
	if new_direction.x > 0.2 :
		anim.flip_h = false
	if new_direction.x < -0.2:
		anim.flip_h = true
	if new_direction.length() != 0.0:
		anim.play("run")
	else:anim.stop()
