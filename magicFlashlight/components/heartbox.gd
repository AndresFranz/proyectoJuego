class_name Heartbox2D
extends Area2D

@export var character_body_2d: CharacterBody2D

func die() ->void:
	get_parent().player_die()
