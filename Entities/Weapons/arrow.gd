class_name Arrow extends Area2D

@export var life_timer: Timer
@export var speed = 600
var is_shoot = false
var shoot_direction = Vector2.ZERO



func reset() -> void:
	position = Vector2.ZERO
	rotation = 0
	is_shoot = false


func shoot(target: Node2D) -> void:
	shoot_direction = (target.global_position - global_position).normalized()
	is_shoot = true
	life_timer.start()


func _process(delta) -> void:
	if is_shoot:
		if life_timer.is_stopped(): reset()
		global_position += shoot_direction * speed * delta


func _on_body_entered(body:Node2D) -> void:
	if not is_shoot: return
	if body.is_in_group("enemies"): return
	if body.is_in_group("player"): body.take_damage(10)
	reset()
