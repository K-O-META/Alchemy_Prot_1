class_name Bow extends Weapon

@export var arrow: Arrow


func rotate_toward(target: Node2D) -> void:
	rotation = (target.global_position - global_position).angle() + deg_to_rad(180)


func attack(target) -> void:
	if arrow.is_shoot: return
	
	arrow.shoot(target)

