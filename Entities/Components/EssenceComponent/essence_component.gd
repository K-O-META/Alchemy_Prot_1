class_name EssenceComponent extends Node2D

# IF MORE THAN ONE ESSENCE
#enum Essences { FIRE, WATER, WIND, EARTH }
#@export var activ_essence: Array[Essences] = [Essences.FIRE]

@export var activ_essence: game_manager.Essences = game_manager.Essences.FIRE

func change_essence(new_essence: game_manager.Essences) -> void:
	activ_essence = new_essence

func return_activ_essence() -> game_manager.Essences:
	return activ_essence
