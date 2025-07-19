class_name Axe extends Weapon

@onready var hitbox = $Hitbox
var is_attacking: bool = false


func reset() -> void:
	is_attacking = false
	hitbox.monitoring = false



func attack(_target) -> void:
	if is_attacking: return

	is_attacking = true
	hitbox.monitoring = true
	await rotate_360()
	reset()


func rotate_360() -> void:
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 360, 0.2).as_relative()
	await tween.finished


func _on_hitbox_body_entered(body:Node2D) -> void:
	if is_attacking and body.is_in_group("player"):
		body.take_damage(10)
