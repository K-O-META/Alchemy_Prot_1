class_name Axe extends Sprite2D

func animate() -> void:
	await rotate_360()



func rotate_360() -> void:
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 360, 0.2).as_relative()
	await tween.finished