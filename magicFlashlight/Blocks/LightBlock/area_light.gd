extends Area2D

@onready var padre: StaticBody2D = get_parent()

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	
func _on_area_entered(area: Area2D):
	padre.desactivar()

func _on_area_exited(area: Area2D):
	padre.activar()
