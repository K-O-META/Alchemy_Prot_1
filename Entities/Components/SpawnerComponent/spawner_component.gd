extends Node2D

@onready var fire_fighter := load("res://Entities/Enemies/fire_fighter.tscn")
@onready var skeleton := load("res://Entities/Enemies/skeleton.tscn")
@onready var spawn_locations = get_children()
@export var enemies_amount: int = 20

func _ready() -> void:
	spawn_lot_of_enemies("skeleton", 20)
	spawn_lot_of_enemies("fire_fighter", 20, spawn_locations[0], 2.0)

func spawn_lot_of_enemies(enemy_name: String, amount: int, spawner: Node2D = null, time_interval: float = 0.0) -> void:
	for i in amount:
		spawn_enemy(enemy_name, spawner)
		await get_tree().create_timer(time_interval).timeout

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_enemy(enemy_name: String, spawner: Node2D = null) -> void: # 0 fo random spawn
	var enemy
	match enemy_name:
		"skeleton":
			enemy = skeleton.instantiate()
		"fire_fighter":
			enemy = fire_fighter.instantiate()
		_:
			print("ERROR: Bad enemy_name")
			return
	var parent = get_parent()
	await get_tree().process_frame
	parent.add_child(enemy)
	
	var random_position: Vector2
	if spawner:
		random_position = spawner.position
	else:
		random_position = spawn_locations.pick_random().position
	var angle = randf_range(0.0, TAU)
	var random_variation = Vector2(cos(angle), sin(angle)) * randi_range(0, 100)
	random_position += random_variation
	enemy.position = random_position
