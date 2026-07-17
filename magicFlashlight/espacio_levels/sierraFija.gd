extends Node2D

@onready var sound: AudioStreamPlayer2D = $"sound"

func _ready() -> void:
	if not sound.playing:
		sound.play()

func _process(delta: float) -> void:
	pass
