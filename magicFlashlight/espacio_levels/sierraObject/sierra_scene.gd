extends Node2D

@export var velocidad: float = 200.0
@export var direccion: int = 1

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT * velocidad * delta * direccion
