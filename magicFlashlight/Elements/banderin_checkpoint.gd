extends Area2D

#@export var marker_2d: Marker2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pass 


func _on_body_entered(body: Node) -> void:
	var player: CharacterBody2D = body as CharacterBody2D	
	if player.has_method("marker_checkpoint"):
		player.marker_checkpoint(self.global_position)
