extends Node2D


var inventory_potions: Array[Potion] = []
var potions_counter: int = 0

func _ready() -> void:
	_load_default_potions()
	pass

#TODO
func load_stage(stage_name: String) -> void:
	match stage_name:
		"menu_stage":
			get_tree().change_scene_to_file("res://Stages/MenuStage/menu_stage.tscn")
		
		"player_base_stage":
			get_tree().change_scene_to_file("res://Stages/PlayerBaseStage/player_base_stage.tscn")
		
		"arena_selection_stage":
			get_tree().change_scene_to_file("res://Stages/ArenaSelectionStage/arena_selection_stage.tscn")
		
		"preparation_stage":
			get_tree().change_scene_to_file("res://Stages/PreparationStage/preparation_stage.tscn")
		
		"arena_0_stage":
			get_tree().change_scene_to_file("res://Stages/Arenas/Arena0/arena_0_stage.tscn")
		
		_:
			print("ERROR: no matching stage_name")
	#TODO
		#"menu_howtoplay_stage":
	
	#TODO
		#"menu_options_stage":



func _load_default_potions() -> void:
	if inventory_potions.is_empty():
		for e in Enums.Essences.values():
			var potion = Potion.new()
			potion.set_essence(e)
			inventory_potions.append(potion)
		
