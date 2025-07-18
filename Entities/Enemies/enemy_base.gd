extends CharacterBody2D

var speed = 100.0

@export var health_component: HealthComponent


func take_damage(amount: int) -> void:
    if not health_component:
        print_debug("No health component attached to enemy.")
        return

    health_component.take_damage(amount)