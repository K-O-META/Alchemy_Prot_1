extends Area2D

@export var cooldown_timer: Timer
var hit_target: Player = null
var damage_amount: int = 10


func _on_body_shape_entered(_body_rid:RID, body:Node2D, _body_shape_index:int, _local_shape_index:int) -> void:
	if body is CharacterBody2D and body.is_in_group("player"):
		hit_target = body


func _on_body_shape_exited(_body_rid:RID, body:Node2D, _body_shape_index:int, _local_shape_index:int) -> void:
	if body == hit_target:
		hit_target = null


func _process(_delta: float) -> void:
	if hit_target and cooldown_timer.is_stopped():
		attack(hit_target)
		cooldown_timer.start()


func attack(target: Player) -> void:
		print("Attacking target: ", target.name)
		# Replace with actual attack logic (effect.apply(target))
		target.take_damage(damage_amount)
