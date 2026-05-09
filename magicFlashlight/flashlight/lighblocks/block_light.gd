extends StaticBody2D

@onready var collisionShape = $CollisionShape2D

func _process(delta: float) -> void:
	pass

func desactivar() -> void:
	self.set_deferred("disabled", false)

func activar() -> void:
	self.set_deferred("disabled", true)
