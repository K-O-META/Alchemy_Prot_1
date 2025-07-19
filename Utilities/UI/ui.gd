extends Control

@onready var potion_icons: Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_potion()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("potion_switch_left"):
		change_potion(false)
	if Input.is_action_just_pressed("potion_switch_right"):
		change_potion()


func change_potion(for_next: bool = true) -> void:
	var potions_indexes: Array = [0,0,0]
	if for_next:
		game_manager.potions_counter += 1
	else:
		game_manager.potions_counter -= 1
	var potions_num = game_manager.inventory_potions.size()
	potions_indexes = [(game_manager.potions_counter-1) % potions_num, game_manager.potions_counter % potions_num, (game_manager.potions_counter+1) % potions_num]
	
	$"PotionSelectionContainer/PreviousPotion".texture = game_manager.inventory_potions[potions_indexes[0]].potion_texture
	$"PotionSelectionContainer/ActualPotion".texture = game_manager.inventory_potions[potions_indexes[1]].potion_texture
	$"PotionSelectionContainer/NextPotion".texture = game_manager.inventory_potions[potions_indexes[2]].potion_texture
