extends Area2D

# --- Variables configurables desde el Inspector ---
@export var amplitud: float = 1.5       # Qué tanto gira hacia cada lado (en radianes)
@export var velocidad: float = 1      # Qué tan rápido hace el movimiento de vaivén

# --- Variables internas ---
var tiempo: float = 0.0
var angulo_centro: float = 0.0

func _ready() -> void:
	# Guardamos la rotación actual como el "centro" del movimiento
	angulo_centro = rotation

func _process(delta: float) -> void:
	# Avanzamos el tiempo según la velocidad
	tiempo += delta * velocidad
	
	# sin(tiempo) va de -1 a 1. Al multiplicarlo por la amplitud, va de -amplitud a +amplitud
	var movimiento = sin(tiempo) * amplitud
	
	# Aplicamos la rotación sobre su propio eje
	rotation = angulo_centro + movimiento
