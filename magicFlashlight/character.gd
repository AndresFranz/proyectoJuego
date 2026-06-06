extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree["parameters/playback"]
@onready var pivote: Node2D = $Pivote


@export var SPEED = 200.0
@export var JUMP_SPEED = 300.0


var is_dead := false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_SPEED

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
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("fall")


func player_die() -> void:
	if is_dead:
		return

	is_dead = true
	playback.travel("hurt")
	await animation_tree.animation_finished
	queue_free()
