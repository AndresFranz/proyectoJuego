extends Area2D

@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pass 

func _on_body_entered(body: Node) -> void:
	var player = body as CharacterBody2D
	sound.play()
	if player.has_method("new_checkpoint"):
		player.new_checkpoint(self.global_position)
