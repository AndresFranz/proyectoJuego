extends Node

@export var main_menu_scene: PackedScene
@export var credits_scene: PackedScene
@export var Levels: Array[PackedScene]
@export var menu_next: PackedScene

var current_level
var checkpointX
var checkpointY

var start_positions: Dictionary = {
0: Vector2(107,-70), # buscar cuales son los valores iniciales
1: Vector2(-354,595),
 }

func start_new() -> void:
	var dict: Dictionary = {"current_level":  0, "checkpointX": null, "checkpointY": null}
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
	checkpointX = null
	checkpointY = null
	save_game()
	get_tree().paused = !get_tree().paused
	if current_level < Levels.size():
		get_tree().change_scene_to_packed(Levels[current_level])
	else:
		credits()

func main_menu() -> void:
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_packed(main_menu_scene)

func credits() -> void:
	get_tree().change_scene_to_packed(credits_scene)
	
func save_game() -> void:
	var dict: Dictionary = {"current_level":  current_level, "checkpointX" : checkpointX,  "checkpointY" : checkpointY}
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
		
	if load_dict.checkpointX == null or load_dict.checkpointY == null:
		checkpointX = null
		checkpointY = null
	
	else: # load_dict.checkpointX != null and load_dict.checkpointY != null:
		checkpointX = float(load_dict.checkpointX)
		checkpointY = float(load_dict.checkpointY)
		
	if load_dict.current_level is float:
		current_level = load_dict.current_level
		
		if not Levels.is_empty() and current_level < Levels.size():
			get_tree().change_scene_to_packed(Levels[current_level])
