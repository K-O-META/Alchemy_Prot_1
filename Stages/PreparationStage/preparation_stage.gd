extends Node2D

var inventory_potions: Array = [0,1]


func _on_back_button_pressed() -> void:
	game_manager.load_stage("arena_selection_stage")


func _on_next_button_pressed() -> void:
	game_manager.inventory_potions = inventory_potions
	game_manager.load_stage("arena_0_stage")
