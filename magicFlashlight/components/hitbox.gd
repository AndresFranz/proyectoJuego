class_name Hitbox2D
extends Area2D

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area: Area2D) -> void:
	print("areaKill")
	if area.has_method("die"):
		print("ALOOOO me estan llamando ono")
		area.die()
