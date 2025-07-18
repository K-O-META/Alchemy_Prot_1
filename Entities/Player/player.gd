class_name Player extends CharacterBody2D

@export var health_component: HealthComponent

var speed := 200.0
var is_shooting: bool = false
var shooting_range: float = 0.0
var range_limit: float = 6.0
var shooting_speed:float = 6.0
var potion_to_throw := load("res://Entities/PotionToThrow/potion_to_throw.tscn")

func _process(delta: float) -> void:
	aiming()
	if Input.is_action_just_pressed("shooting"):
		is_shooting = true
	if is_shooting:
		start_shooting(delta)

func start_shooting(delta: float) -> void:
	shooting_range += delta * shooting_speed
	if shooting_range > range_limit:
		shooting_range = range_limit
	$AimingArrow/ForceBar.position.y = -74 + (shooting_range * 37)
	if Input.is_action_just_released("shooting"):
		is_shooting = false
		var direction = (get_global_mouse_position() - global_position).normalized() * 100
		var destination = global_position + (0.36 * direction) + (shooting_range * $AimingArrow/ForceBar.size.y/100) * direction
		shoot(destination)
		shooting_range = 0.0
	$AimingArrow/ForceBar.scale.y = shooting_range

func shoot(destination: Vector2) -> void:
	var grenade = potion_to_throw.instantiate()
	get_parent().add_child(grenade)
	grenade.init_grenade(position, destination)

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
	
	velocity = input_vector * speed
	move_and_slide()

func aiming() -> void:
	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position
	var direction = mouse_pos - player_pos
	var angle = direction.angle() + PI/2
	$AimingArrow.rotation = angle


func take_damage(damage: int) -> void:
	# Placeholder for damage logic
	print("Player took damage: ", damage)
	placeholder_blink_red()
	if health_component:
		health_component.take_damage(damage)


func placeholder_blink_red() -> void:
	# Placeholder for blink red logic
	$PlayerColor.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.1).timeout
	$PlayerColor.modulate = Color(1, 1, 1)
