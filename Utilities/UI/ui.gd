extends Control

@onready var potion_icons: Array = []

func change_potion(for_next: bool = true) -> void:
	var potions_indexes: Array = [0,0,0]
	if for_next:
		game_manager.potions_counter += 1
	else:
		game_manager.potions_counter -= 1
	var potions_num = game_manager.inventory_potions.size()
	potions_indexes = [game_manager.potions_counter % potions_num, (game_manager.potions_counter+1) % potions_num, (game_manager.potions_counter+2) % potions_num]
	
	$"PotionSelectionContainer/PreviousPotion".texture = potion_icons[potions_indexes[0]]
	$"PotionSelectionContainer/ActualPotion".texture = potion_icons[potions_indexes[1]]
	$"PotionSelectionContainer/NextPotion".texture = potion_icons[potions_indexes[2]]

func load_potions() -> void:
	potion_icons.append(load("res://Assets/Potion Blue.png"))
	potion_icons.append(load("res://Assets/Potion Green.png"))
	potion_icons.append(load("res://Assets/Potion Grey.png"))
	potion_icons.append(load("res://Assets/Potion Purple.png"))
	potion_icons.append(load("res://Assets/Potion Red.png"))
	potion_icons.append(load("res://Assets/Potion Yellow.png"))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_potions()
	change_potion()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("potion_switch_left"):
		change_potion(false)
	if Input.is_action_just_pressed("potion_switch_right"):
		change_potion()
