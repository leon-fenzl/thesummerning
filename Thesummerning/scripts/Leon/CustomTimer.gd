extends Node

signal spawnLvl1
signal spawnLvl2
signal spawnLvl3
signal spawnLvl4
@export var startTimer : float
@onready var currentTime : float
func _physics_process(delta):
	CustomTimer(delta)
	print(currentTime)
func CustomTimer(d:float):
	currentTime -= d 
	if currentTime <= startTimer*0.1:
		emit_signal("spawnLvl1")
	if currentTime <= startTimer*0.25:
		emit_signal("spawnLvl2")
	if currentTime <= startTimer*0.5:
		emit_signal("spawnLvl3")
	if currentTime <= startTimer - startTimer:
		emit_signal("spawnLvl4")
		ResetTimer()
func ResetTimer():
	currentTime = startTimer
