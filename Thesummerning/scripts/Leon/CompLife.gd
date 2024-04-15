extends Node3D
@export var life : int = 10

func FeedLifeValue(value:int):
	value = life
func TakeDamage(dmg:int):
	life -= dmg
	print(life)
