extends Node2D

@export var cooldown_timer: Timer
@export var weapon: Weapon
@export var targetfinder: TargetingComponent

var damage_amount: int = 10


func _ready() -> void:
	if not targetfinder:
		printerr("targetfinder (of type TargetingComponent) not set in " + str(get_parent().name))


func _process(_delta: float) -> void:
	if targetfinder.hit_target and cooldown_timer.is_stopped():
		attack(targetfinder.hit_target)
		cooldown_timer.start()


func attack(target: Player) -> void:
		if weapon:
			weapon.attack(target)



# editor

# func _get_configuration_warning() -> String:
# 	var warnings = []

# 	if not targetfinder:
# 		warnings.append('targetfinder (of type TargetingComponent) not set')

# 	if not cooldown_timer:
# 		warnings.append('cooldown_timer not set')

# 	return "\n".join(warnings)
