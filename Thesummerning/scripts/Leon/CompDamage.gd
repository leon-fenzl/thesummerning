extends Node3D

@export var damage : int = 1
@export var tagetType : String
@export var canAttack := false
func _on_area_3d_body_entered(body):
	if body.is_in_group(tagetType):
		body.compLife.TakeDamage(damage)
