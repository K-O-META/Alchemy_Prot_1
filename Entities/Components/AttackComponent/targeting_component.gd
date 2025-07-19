class_name TargetingComponent extends Area2D

var hit_target: Player = null

func _on_body_shape_entered(_body_rid:RID, body:Node2D, _body_shape_index:int, _local_shape_index:int) -> void:
	if body is CharacterBody2D and body.is_in_group("player"):
		hit_target = body


func _on_body_shape_exited(_body_rid:RID, body:Node2D, _body_shape_index:int, _local_shape_index:int) -> void:
	if body == hit_target:
		hit_target = null


