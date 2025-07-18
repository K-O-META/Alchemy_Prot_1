extends Area2D

var is_alive: bool = true
var lifespan: float = 1.0
var life_duration: float = 0.0
var start_position: Vector2
var destination: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match (game_manager.potions_counter + 1) % 2:
		0:$PotionTexture.texture = load("res://Assets/Potion Blue.png")
		1:$PotionTexture.texture = load("res://Assets/Potion Red.png")

func init_grenade(position_t: Vector2, destination_t: Vector2) -> void:
	start_position = position_t
	position = position_t
	destination = destination_t

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	life_duration += delta
	if life_duration <= lifespan:
		position = lerp(start_position, destination, (life_duration/lifespan))
	else:
		if is_alive:
			is_alive = false
			explode()

func explode() -> void:
	$Explosion.visible = true
	var bodies = $Explosion.get_overlapping_bodies()
	for body in bodies:
		if body.has_method("take_damage"):
			body.take_damage(4)
	
	await get_tree().create_timer(1.0).timeout
	queue_free()
