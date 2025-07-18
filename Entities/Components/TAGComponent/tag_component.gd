class_name TAGComponent extends Node2D

enum Essence_reaction { VULNERABLE, RESISTANT, HEALS_ME }
@export var tag: game_manager.Essences = game_manager.Essences.FIRE
@export var reaction: Essence_reaction = Essence_reaction.VULNERABLE

func reaction_for_damage(essence: game_manager.Essences, damage: float) -> void:
	if essence == tag:
		if reaction == Essence_reaction.VULNERABLE:
			damage *= 2
		elif reaction == Essence_reaction.RESISTANT:
			damage *= 0.5
		elif reaction == Essence_reaction.HEALS_ME:
			damage *= -0.3
