extends Node2D

@onready var fire_fighter := load("res://Entities/Enemies/fire_fighter.tscn")
@onready var skeleton := load("res://Entities/Enemies/skeleton.tscn")
@export var enemies_amount: int = 20
# TODO
#@export var fire_fighters_amount: int = 2
#@export var skeletons_amount: int = 2

func _ready() -> void:
	for i in enemies_amount:
		spawn_enemy("fire_fighter")
	for i in enemies_amount:
		spawn_enemy("skeleton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_enemy(enemy_name: String) -> void:
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
	
	var spawn_locations = get_children()
	var random_position = spawn_locations[randi() % spawn_locations.size()].position
	var angle = randf_range(0.0, TAU)
	var random_variation = Vector2(cos(angle), sin(angle)) * 100
	random_position += random_variation
	enemy.position = random_position
