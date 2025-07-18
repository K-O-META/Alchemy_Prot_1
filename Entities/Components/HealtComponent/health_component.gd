class_name HealthComponent extends Node2D

@export var max_health: int = 10
var current_health: int


func _ready() -> void:
	current_health = max_health


func take_damage(amount: int) -> void:
	current_health -= amount
	if current_health <= 0:
		die()


func die() -> void:
	# Handle death logic here, e.g., play animation, drop loot, etc.
	var parent = get_parent()
	print("Enemy died: ", parent.name)
	parent.queue_free()
