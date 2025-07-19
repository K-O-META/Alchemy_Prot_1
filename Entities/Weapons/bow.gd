class_name Bow extends Weapon

@export var arrow: Arrow


func attack(target) -> void:
	if arrow.is_shoot: return
	
	arrow.shoot(target)
