extends CharacterBody2D

@export var max_speed = 3000

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var speed = max_speed

func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -1
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -1
	else:
		velocity.y = 0

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta
		
	move_and_slide()
