class_name Behaviour extends Node2D

var target: Node2D
var parent: Node2D

func _ready() -> void:
	_assign_player_target()
	parent = get_parent()


func _assign_player_target() -> void:
	target = get_tree().get_nodes_in_group("player").front()
	if not target:
		print_debug("No player found in group 'player'.")

