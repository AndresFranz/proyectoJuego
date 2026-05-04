extends Node2D

@onready var Light = $PointLight2D
@onready var Area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Light.visible = false
	Area.monitorable = false
	Area.monitoring = false 

	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("turn_on_off"):
		Light.visible = not Light.visible
		Area.monitorable = not Area.monitorable
		Area.monitoring = not Area.monitoring 
