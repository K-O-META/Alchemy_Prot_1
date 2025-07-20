class_name Weapon extends Node2D


func attack(_target: Node2D) -> void:
	push_error("You must override `attack()` in a subclass of Weapon.")


func rotate_toward(_target: Node2D) -> void:
	push_error("You must override `rotate_toward()` in a subclass of Weapon.")
