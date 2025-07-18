extends Behaviour

var target: Node2D
var parent: Node2D

func _ready() -> void:
	_assign_player_target()
	parent = get_parent()


func _assign_player_target() -> void:
	target = get_tree().get_nodes_in_group("player").front()
	if not target:
		print_debug("No player found in group 'player'.")


func _physics_process(delta: float) -> void:

	if target:
		if parent.position.distance_to(target.position) < 50.0: return
		var direction = (target.position - parent.position).normalized()
		parent.position += direction * parent.speed * delta
