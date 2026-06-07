extends Area2D

@export var menu_finalizacion: Control
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var already_finished := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if already_finished:
		return

	if body.is_in_group("Player") or body.name == "Character":
		already_finished = true
		
		sprite_2d.visible = false
		sprite_2d_2.visible = true
		

		body.win_dance()

		await get_tree().create_timer(3.0).timeout

		menu_finalizacion.visible = true
		menu_finalizacion.process_mode = Node.PROCESS_MODE_ALWAYS
		get_tree().paused = true
