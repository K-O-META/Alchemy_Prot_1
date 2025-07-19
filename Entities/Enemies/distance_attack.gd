extends Area2D

@export var cooldown_timer: Timer
@export var weapon: Node2D
@export var targetfinder: TargetingComponent

var damage_amount: int = 10


func _process(_delta: float) -> void:
	if targetfinder.hit_target and cooldown_timer.is_stopped():
		attack(targetfinder.hit_target)
		cooldown_timer.start()


func attack(target: Player) -> void:
		print("Attacking target: ", target.name)
		# Replace with actual attack logic (effect.apply(target))
		if weapon:
			weapon.animate()  # Assuming the weapon has an animate method
		target.take_damage(damage_amount)
