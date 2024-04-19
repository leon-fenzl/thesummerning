extends Node

@export var life : int
@onready var parentNode := $".."

func _ready():
	parentNode.LIFE = life
func FeedLifeValue(value:int):
	value = parentNode.life
func TakeDamage(dmg:int):
	if life > 0:
		parentNode.LIFE -= dmg
		print(parentNode.name,life)
	else:
		if parentNode.is_in_group("player"):
			parentNode.Death()
		if parentNode.is_in_group("guards"):
			parentNode.Death()
		if parentNode.is_in_group("mobs"):
			parentNode.Death()
