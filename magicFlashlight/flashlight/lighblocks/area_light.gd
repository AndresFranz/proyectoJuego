extends Area2D

@onready var padre: StaticBody2D = get_parent()

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	
func _on_area_entered(area: Area2D):
	print("luz interactua con Area")
	padre.desactivar()

func _on_area_exited(area: Area2D):
	print("luz Desinteractua con Area")
	padre.activar()
