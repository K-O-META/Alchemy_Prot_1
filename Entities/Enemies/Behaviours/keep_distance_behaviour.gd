class_name KeepDistanceBehaviour extends Behaviour

@export var min_distance: float = 100.0
@export var max_distance: float = 200.0


func _physics_process(delta: float) -> void:
	if target:
		var target_distance = parent.position.distance_to(target.position)
		var target_direction = (target.position - parent.position).normalized()
		
		if target_distance > max_distance:
			parent.position += target_direction * parent.speed * delta

		elif target_distance < min_distance:
			parent.position -= target_direction * parent.speed * delta
