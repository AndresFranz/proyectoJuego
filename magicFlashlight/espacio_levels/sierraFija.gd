extends Node2D

@onready var sound: AudioStreamPlayer2D = $"sound"

func _ready() -> void:
	if not sound.playing:
		sound.play()

func _process(delta: float) -> void:
	rotation += 2.0 * delta
	rotation = wrapf(rotation, 0.0, TAU)
