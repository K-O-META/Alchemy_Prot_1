extends Area2D

var lifespan: float
var life_duration: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match game_manager.potions_counter:
		0:$TextureRect.texture = load("res://Assets/Potion Blue.png")
	

func init_grenade(position_t: Vector2) -> void:
	position = position_t

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	life_duration += delta
