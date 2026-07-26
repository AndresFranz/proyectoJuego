extends Node2D

@onready var sound: AudioStreamPlayer2D = $sound

@export var amplitud: float = 1.5
@export var velocidad: float = 1.0

var tiempo: float = 0.0
var angulo_centro: float = 0.0
var lado_anterior: int = 0

func _ready() -> void:
	angulo_centro = rotation

func _process(delta: float) -> void:
	tiempo += delta * velocidad
	
	var valor_seno: float = sin(tiempo)
	var movimiento: float = valor_seno * amplitud
	
	rotation = angulo_centro + movimiento
	
	var lado_actual: int = int(sign(valor_seno))
	
	if lado_anterior != 0 and lado_actual != lado_anterior:
		sound.play()
	
	if lado_actual != 0:
		lado_anterior = lado_actual
