class_name TAGComponent extends Node2D


@export var tag: Enums.Essences = Enums.Essences.FIRE
@export var reaction: Enums.EssenceReaction = Enums.EssenceReaction.VULNERABLE


func reaction_for_damage(essence: Enums.Essences, damage: float) -> float:
	if essence == tag:
		if reaction == Enums.EssenceReaction.VULNERABLE:
			return damage * 2
		elif reaction == Enums.EssenceReaction.RESISTANT:
			return damage * 0.5
		elif reaction == Enums.EssenceReaction.HEALS_ME:
			return damage * -0.3

	return damage