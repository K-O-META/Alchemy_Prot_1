extends CharacterBody2D

var speed = 100.0

@export var health_component: HealthComponent


func take_damage(essence: Enums.Essences, amount: int) -> void:
	if not health_component:
		print_debug("No health component attached to enemy.")
		return
	print("Enemy took damage: ")
	health_component.take_damage(essence, amount)
