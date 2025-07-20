class_name HealthComponent extends Node2D

@export var max_health: int = 10
var current_health: int
@onready var health_bar: Control = $HealthBar

func _ready() -> void:
	current_health = max_health
	if get_parent() is Player:
		health_bar.visible = false


func take_damage(essence: Enums.Essences, amount: int) -> void:
	if has_node("ReactionComponent"):
		amount = $ReactionComponent.reaction_for_damage(essence, amount)
	current_health -= amount
	print(amount)
	if current_health <= 0:
		die()
	health_bar.get_node("HPBar").scale.x = float(current_health) / max_health


func die() -> void:
	# Handle death logic here, e.g., play animation, drop loot, etc.
	var parent = get_parent()
	print("Enemy died: ", parent.name)
	parent.queue_free()
