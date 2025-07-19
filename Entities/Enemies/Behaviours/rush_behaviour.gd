class_name RushBehaviour extends Behaviour

@export var min_distance: float = 50.0


func _physics_process(delta: float) -> void:
	if target:
		if parent.position.distance_to(target.position) < min_distance: return
		var direction = (target.position - parent.position).normalized()
		parent.position += direction * parent.speed * delta
