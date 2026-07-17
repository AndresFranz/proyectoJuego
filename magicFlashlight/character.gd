extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree["parameters/playback"]
@onready var pivote: Node2D = $Pivote
@onready var linterna: Node2D = $LinternaObject
@onready var point_light: PointLight2D = $PointLight2D
@onready var run_sound: AudioStreamPlayer2D = $run_sound
@onready var jump_sound: AudioStreamPlayer2D = $jump_sound
@onready var die_sound: AudioStreamPlayer2D = $die_sound

@export var SPEED = 180.0
@export var JUMP_SPEED = 300.0


var is_dead := false
var has_won := false


func _ready() -> void:
	if LevelManager.checkpointX == null or LevelManager.checkpointY == null:
		global_position = LevelManager.start_positions[int(LevelManager.current_level)]
	else:
		global_position = Vector2(float(LevelManager.checkpointX),float(LevelManager.checkpointY))
	return

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	
	if has_won:
		return

	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_SPEED
		jump_sound.play()

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if direction:
		pivote.scale.x = sign(direction)

	if is_on_floor():
		if abs(velocity.x) > 10 or direction:
			playback.travel("run")
			
			if not run_sound.playing:
				run_sound.play()
		else:
			playback.travel("idle")
			run_sound.stop()
	else:
		if run_sound.playing:
			run_sound.stop()
		
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("fall")


func player_die() -> void:
	if is_dead:
		return

	is_dead = true
	
	if run_sound.playing:
		run_sound.stop()
	
	die_sound.play()
	
	playback.travel("hurt")
	await animation_tree.animation_finished
	queue_free()
	get_tree().reload_current_scene()


func win_dance() -> void:
	if has_won:
		return

	has_won = true
	
	linterna.visible = false
	point_light.visible = false
	
	if run_sound.playing:
		run_sound.stop()
	
	velocity.x = 0

	while not is_on_floor():
		velocity.y += get_gravity().y * get_physics_process_delta_time()
		move_and_slide()
		playback.travel("fall")
		await get_tree().physics_frame

	velocity = Vector2.ZERO
	playback.travel("win")
	
func new_checkpoint(new_position: Vector2) -> void:
	LevelManager.checkpointX = new_position[0]
	LevelManager.checkpointY = new_position[1]
	return 
