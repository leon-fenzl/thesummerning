extends Marker3D

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	pass # Replace with function body.

func spawn():
	for n in 5:
		var type = randf_range(0,2)
		var spawned_scene = load("res://Scenes/testScenes/EnemyBase.tscn").instantiate()
		position.x = randf_range(-4.249,3.623)
		position.z = randf_range(6.152,-7.75)
		match type:
			0:
				spawned_scene = load("res://Scenes/testScenes/enemy_FanGirlTest.tscn").instantiate()
			1:
				spawned_scene = load("res://Scenes/testScenes/enemy_Bombado.tscn").instantiate()
			2:
				spawned_scene = load("res://Scenes/testScenes/enemy_Tiozao.tscn").instantiate()
		spawned_scene.position.x = position.x
		spawned_scene.position.z = position.z
		add_child(spawned_scene)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
