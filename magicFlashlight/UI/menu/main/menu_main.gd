extends Control

@onready var menu_principal: Control = $PanelContainer
@onready var menu_post_main: Control = $MenuPostMain

# Botones del menú principal
@onready var start: Button = %Start
@onready var quit: Button = %Quit
@onready var credits: Button = %Credits

# Botones del post-menú
@onready var load_button: Button = $MenuPostMain/PanelContainer/MarginContainer/VBoxContainer/load
@onready var new_button: Button = $MenuPostMain/PanelContainer/MarginContainer/VBoxContainer/new
@onready var back_button: Button = $MenuPostMain/PanelContainer/MarginContainer/VBoxContainer/back


func _ready() -> void:
	menu_principal.visible = true
	menu_post_main.visible = false

	start.pressed.connect(_on_start_pressed)
	quit.pressed.connect(_on_quit_pressed)
	credits.pressed.connect(_on_credits_pressed)

	load_button.pressed.connect(_on_load_pressed)
	new_button.pressed.connect(_on_new_pressed)
	back_button.pressed.connect(_on_back_pressed)


func _on_start_pressed() -> void:
	menu_principal.visible = false
	menu_post_main.visible = true


func _on_back_pressed() -> void:
	menu_post_main.visible = false
	menu_principal.visible = true


func _on_load_pressed() -> void:
	LevelManager.load_game()


func _on_new_pressed() -> void:
	LevelManager.start_new()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	LevelManager.credits()
