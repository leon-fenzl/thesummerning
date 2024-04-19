extends Area3D

@export var canAttack := false
@onready var targetTag : String
@onready var parentNode := $".."
@onready var targetBody : Node

func _ready():
	targetTag = parentNode.targetTag
func _on_body_entered(body):
	if body.is_in_group(targetTag):
		print(body)
		targetBody = body
		$Timer.start(0.5)
func _on_timer_timeout():
	DealDamage(targetBody)
	parentNode.ATTACK(targetBody)
func _on_body_exited(body):
	$Timer.stop()
	targetBody = null
func DealDamage(body:Node):
	body.life -= parentNode.dmg
	if body.life > 0:
		body.life -= parentNode.dmg
		print(body.life)
	else:
		body.Death()
