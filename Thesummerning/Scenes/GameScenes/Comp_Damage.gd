extends Node3D
@export var life : int = 10

func TakeDamage(dmg:int):
	life -= dmg
	print(life)
