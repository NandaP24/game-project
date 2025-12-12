extends CharacterBody2D
class_name MCController

@export var speed = 10.0
@export var jump_power = 20

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0

var is_attacking = false

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Attack
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier

	# Movement (SELALU AKTIF meskipun attack)
	direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()


func reset_state():
	is_attacking = false
