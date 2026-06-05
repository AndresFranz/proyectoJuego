extends StaticBody2D

@onready var colision_pared = $collisionWall
@onready var area_kill = $areaKill/collisionKill

func _ready() -> void:
	colision_pared.set_deferred("disabled", true)
	area_kill.set_deferred("disabled", true)

func desactivar() -> void:
	area_kill.set_deferred("disabled", false)
	colision_pared.set_deferred("disabled", false)

func activar() -> void:
	area_kill.set_deferred("disabled", true)
	colision_pared.set_deferred("disabled", true)
