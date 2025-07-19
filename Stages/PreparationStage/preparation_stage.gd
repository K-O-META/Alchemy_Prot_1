extends Node2D


func update_inventory() -> void:
	var inventory_potions: Array[Potion] = []
	var potion = Potion.new()
	potion.set_essence(Enums.Essences.FIRE)
	inventory_potions.append(potion)
	potion = Potion.new()
	potion.set_essence(Enums.Essences.ICE)
	inventory_potions.append(potion)
	game_manager.inventory_potions = inventory_potions


func _on_back_button_pressed() -> void:
	game_manager.load_stage("arena_selection_stage")


func _on_next_button_pressed() -> void:
	update_inventory()
	game_manager.load_stage("arena_0_stage")
