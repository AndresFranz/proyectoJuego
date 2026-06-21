extends Control

@onready var start: Button = %Start
@onready var quit: Button = %Quit
@onready var credits: Button = %Credits

func _ready() -> void:
	start.pressed.connect(_on_start_pressed) 
	quit.pressed.connect(_on_quit_pressed)
	credits.pressed.connect(_on_credits_pressed)
	#save.pressed.connect(_on_save_pressed)
	#load_game.pressed.connect(_on_load_game_pressed)

func _on_start_pressed() -> void:
	print("start")
	LevelManager.start_continue()
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_credits_pressed() -> void:
	LevelManager.credits()
"""
func _on_save_pressed() -> void:
	print("partida guardada debug")
	LevelManager.save_game()
	
func _on_load_game_pressed() -> void:
	print("partida cargada debug")
	LevelManager.load_game()
"""
