class_name Heartbox2D
extends Area2D

@export var character_body_2d: CharacterBody2D

func die() ->void:
	print("alo debugeo queque de personaje")
	get_parent().player_die()
