class_name TAGComponent extends Node2D

enum Essence_TAG { FIRE, ICE }
enum Essence_reaction { VULNERABLE, RESISTANT, HEALS_ME }
@export var tag: Essence_TAG = Essence_TAG.FIRE
@export var reaction: Essence_reaction = Essence_reaction.VULNERABLE

func reaction_for_damage(essence: game_manager.Essences, damage: float) -> void:
	if essence == tag:
		if reaction == Essence_reaction.VULNERABLE:
			damage *= 2
		elif reaction == Essence_reaction.RESISTANT:
			damage *= 0.5
		elif reaction == Essence_reaction.HEALS_ME:
			damage *= -0.3

"""enum TAGs { FIRE_VULNERABLE, FIRE_RESISTANT, FIRE_HEALS_ME,
ICE_VULNERABLE, ICE_RESISTANT, ICE_HEALS_ME }

@export var tags_array: Array[TAGs] = [TAGs.FIRE_VULNERABLE]

func reaction_for_damage(essence: game_manager.Essences, damage: float) -> void:
	for tag in tags_array:
		if essence == tag:
			TAGs.FIRE_VULNERABLE:
				if essence == game_manager.Essences.FIRE:
					damage *= 2"""
