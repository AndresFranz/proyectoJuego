extends StaticBody2D

@onready var colision_pared: CollisionShape2D = $collisionWall
@onready var area_kill: CollisionShape2D = $areaKill/collisionKill

func _ready() -> void:
	colision_pared.set_deferred("disabled", true)
	area_kill.set_deferred("disabled", true)

func desactivar() -> void:
	area_kill.set_deferred("disabled", false)
	colision_pared.set_deferred("disabled", false)

func activar() -> void:
	area_kill.set_deferred("disabled", true)
	colision_pared.set_deferred("disabled", true)
