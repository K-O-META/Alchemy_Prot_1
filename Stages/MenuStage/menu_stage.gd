extends Node2D


func _on_start_button_pressed() -> void:
	game_manager.load_stage("player_base_stage")


func _on_howtoplay_button_pressed() -> void:
	print("STAGE NOT READY")
	# Replace with function body.
	#game_manager.load_stage("menu_howtoplay_stage")


func _on_options_button_pressed() -> void:
	print("STAGE NOT READY")
	# Replace with function body.
	#game_manager.load_stage("menu_options_stage")
