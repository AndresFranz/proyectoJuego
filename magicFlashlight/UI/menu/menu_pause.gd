extends Control

@onready var resume: Button = $Panel/MarginContainer/VBoxContainer/resume
@onready var replay: Button = $Panel/MarginContainer/VBoxContainer/replay
@onready var credits: Button = $Panel/MarginContainer/VBoxContainer/credits
@onready var next: Button = $Panel/MarginContainer/VBoxContainer/next

func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	replay.pressed.connect(_on_replay_pressed)
	next.pressed.connect(_on_next_pressed)
	credits.pressed.connect(_on_credits_pressed)


func _on_resume_pressed() -> void:
	get_tree().paused = false
	visible = false
	
func _on_replay_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	visible = false

func _on_next_pressed() -> void:
	visible = false
	LevelManager.NextLevel()
	
func _on_credits_pressed() -> void:
	visible = false
	LevelManager.credits()
