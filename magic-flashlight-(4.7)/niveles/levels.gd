extends Node2D  # O Node2D / Node3D, dependiendo de tu juego

# Cambia "MenuPausa" por el nombre exacto de tu nodo de menú en la escena
@onready var menu_pause: Control = $menu/menu_pause

func _input(event):
	# Detecta si se presionó la acción "pausa" (la tecla P)
	if event.is_action_pressed("pause"):
		conmutar_pausa()

func conmutar_pausa():
	# Invierte el estado actual de la pausa en el motor de Godot
	get_tree().paused = !get_tree().paused
	
	# Muestra el menú si el juego está pausado, lo oculta si no
	menu_pause.visible = get_tree().paused
