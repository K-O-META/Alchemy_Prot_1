class_name EssenceComponent extends Node2D

@export var essence: game_manager.Essences = game_manager.Essences.FIRE

func return_essence() -> game_manager.Essences:
	return essence
