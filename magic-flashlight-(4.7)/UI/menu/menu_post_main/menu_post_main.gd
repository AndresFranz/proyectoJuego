extends Control

@onready var load: Button = $PanelContainer/MarginContainer/VBoxContainer/load
@onready var new: Button = $PanelContainer/MarginContainer/VBoxContainer/new
@onready var back: Button = $PanelContainer/MarginContainer/VBoxContainer/back
#@onready var new: Button = $Panel/MarginContainer/VBoxContainer/load
#@onready var new: Button = $Panel/MarginContainer/VBoxContainer/new
#@onready var back: Button = $Panel/MarginContainer/VBoxContainer/back
#@onready var menu: Button = $Panel/MarginContainer/VBoxContainer/menu

func _ready() -> void:
	load.pressed.connect(_on_load_pressed)
	new.pressed.connect(_on_new_pressed)
	back.pressed.connect(_on_back_pressed)

func _on_load_pressed()  -> void:
	print("alo si funcionna el boton de load, falla otra cosa?")
	LevelManager.load_game()
	
func _on_new_pressed()  -> void:
	LevelManager.start_new()
	
func _on_back_pressed()  -> void:
	LevelManager.back_to_main()
