class_name Arrow extends Area2D

var bow: Bow
@export var life_timer: Timer
@export var speed = 600
var is_shoot = false
var shoot_direction



func _ready() -> void:
	bow = get_parent()


func reset() -> void:
	if bow == null: 
		queue_free()
		return
	await get_tree().process_frame
	reparent(bow)
	position = Vector2(-22.0, 0)
	rotation = 0
	is_shoot = false


func shoot(target: Node2D) -> void:
	shoot_direction = (target.global_position - global_position).normalized()
	is_shoot = true
	reparent(get_tree().current_scene)
	life_timer.start()


func _process(delta) -> void:
	if is_shoot:
		if life_timer.is_stopped(): reset()
		global_position += shoot_direction * speed * delta


func _on_body_entered(body:Node2D) -> void:
	if not is_shoot: return
	if body.is_in_group("enemies"): return
	if body.is_in_group("player"): body.take_damage(Enums.Essences.BASIC, 10)
	reset()
