extends Node2D



func _on_back_button_pressed() -> void:
	game_manager.load_stage("player_base_stage")


func _on_next_button_pressed() -> void:
	game_manager.load_stage("preparation_stage")
