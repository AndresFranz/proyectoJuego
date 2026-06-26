extends Node

@export var main_menu_scene: PackedScene
#@export var credits_scene: PackedScene
@export var Levels: Array[PackedScene]
@export var menu_next: PackedScene

var current_level

func start_new() -> void:
	var dict: Dictionary = {"current_level":  0}
	var actual_info = JSON.stringify(dict)
	var file = FileAccess.open_encrypted_with_pass("user://save.data", FileAccess.WRITE, "1234")
	file.store_string(actual_info)
	file.close()
	load_game()
	get_tree().change_scene_to_packed(Levels[current_level])
	
func start_continue() -> void:
	get_tree().change_scene_to_packed(menu_next)

func back_to_main() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)

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
	
func save_game() -> void:
	var dict: Dictionary = {"current_level":  current_level}
	var actual_info = JSON.stringify(dict)
	var file = FileAccess.open_encrypted_with_pass("user://save.data", FileAccess.WRITE, "1234") # cambiar esto despues xd
	file.store_string(actual_info)
	file.close()
	
func load_game() -> void:
	if not FileAccess.file_exists("user://save.data"):
		return
	
	var file = FileAccess.open_encrypted_with_pass("user://save.data", FileAccess.READ, "1234")
	if file == null:
		return
	
	var load_dict = JSON.parse_string(file.get_as_text())
	file.close()
	
	if load_dict == null:
		return
	if load_dict.current_level is float:
		current_level = load_dict.current_level
		if not Levels.is_empty() and current_level < Levels.size():
			get_tree().change_scene_to_packed(Levels[current_level])
