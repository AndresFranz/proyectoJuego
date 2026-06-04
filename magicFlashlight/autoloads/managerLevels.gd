extends Node

@export var main_menu_scene: PackedScene
#@export var credits_scene: PackedScene
@export var Levels: Array[PackedScene]

var current_level = 0

func start() -> void:
	current_level = 0
	print("¿El array tiene niveles?: ", Levels.size())
	if not Levels.is_empty():
		print("managerStartIF")
		get_tree().change_scene_to_packed(Levels[0])

func next_level() -> void:
	current_level += 1
	if current_level < Levels.size():
		get_tree().change_scene_to_packed(Levels[current_level])
	else:
		#credits()
		pass

func main_menu() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)

func credits() -> void:
	pass
	#get_tree().change_scene_to_packed(credits_scene)
