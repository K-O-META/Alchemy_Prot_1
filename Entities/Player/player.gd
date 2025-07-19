class_name Player extends CharacterBody2D

@export var health_component: HealthComponent

@export var move_speed: float = 200.0
@export var dash_distance: float = 100
@export var dash_cooldown: float = 1.0
var is_dash_on_cooldown: bool = false
var is_shooting: bool = false
var actual_shooting_range: float = 0.0
@export var range_limit: float = 6.0
@export var shooting_speed:float = 6.0
var potion_to_throw_scene := load("res://Entities/Potion/potion_to_throw.tscn")

func _process(delta: float) -> void:
	# MOVING
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
	velocity = input_vector * move_speed
	move_and_slide()
	
	if Input.is_action_just_pressed("dash") and not is_dash_on_cooldown:
		dash(input_vector)
	
	#SHOOTING
	aiming()
	if Input.is_action_just_pressed("shooting"):
		is_shooting = true
	if is_shooting:
		start_shooting(delta)

	# DASHING
func dash(input_vector: Vector2) -> void:
	is_dash_on_cooldown = true
	var direction
	# DASHING DIRECTION
	if input_vector:
		direction = input_vector * dash_distance
	else:
		direction = (get_global_mouse_position() - global_position).normalized() * dash_distance
	position += direction
	await get_tree().create_timer(dash_cooldown).timeout
	is_dash_on_cooldown = false

# SHOOTING
func aiming() -> void:
	var mouse_pos = get_global_mouse_position()
	var player_pos = global_position
	var direction = mouse_pos - player_pos
	var angle = direction.angle() + PI/2
	$AimingArrow.rotation = angle

func start_shooting(delta: float) -> void:
	actual_shooting_range += delta * shooting_speed
	if actual_shooting_range > range_limit:
		actual_shooting_range = range_limit
	$AimingArrow/ForceBar.position.y = -74 + (actual_shooting_range * 37)
	if Input.is_action_just_released("shooting"):
		is_shooting = false
		var direction = (get_global_mouse_position() - global_position).normalized() * 100
		var destination = global_position + (0.36 * direction) + (actual_shooting_range * $AimingArrow/ForceBar.size.y/100) * direction
		shoot(destination)
		actual_shooting_range = 0.0
	$AimingArrow/ForceBar.scale.y = actual_shooting_range

func shoot(destination: Vector2) -> void:
	var potion_to_throw = potion_to_throw_scene.instantiate()
	get_parent().add_child(potion_to_throw)
	# ADVANCED MATH, BECOUSE WE WILL MAKE IT WITH INVENTORY SYSTEM LATER
	var current_potion: Potion = game_manager.inventory_potions[game_manager.potions_counter % game_manager.inventory_potions.size()]
	potion_to_throw.init_potion_to_throw(position, destination, current_potion)


# TAKING DAMAGE
func take_damage(essence: Enums.Essences, damage: int) -> void:
	# Placeholder for damage logic
	print("Player took damage: ")
	placeholder_blink_red()
	if health_component:
		health_component.take_damage(essence, damage)

func placeholder_blink_red() -> void:
	# Placeholder for blink red logic
	$PlayerColor.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.1).timeout
	$PlayerColor.modulate = Color(1, 1, 1)
