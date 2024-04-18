extends Area3D

@export var life : int
@export var damage : int
@export var canAttack := false
@onready var targetTag
@onready var parentNode := $".."

func FeedLifeValue(value:int):
	value = life
func TakeDamage(dmg:int):
	if life > 0:
		life -= dmg
	else:
		remove_child(parent)
		queue_free()
	print(life)

func _ready():
	targetTag = parentNode.targetTag
func _on_area_3d_body_entered(body):
	if body.is_in_group(targetTag):
		body.compLife.TakeDamage(damage)
