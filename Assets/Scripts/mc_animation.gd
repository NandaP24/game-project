extends Node2D

@export var mc_controller: MCController
@export var animation_player: AnimationPlayer
@export var sprite: Sprite2D

func _process(_delta):
	# Flip character
	if mc_controller.direction == 1:
		sprite.flip_h = false
	elif mc_controller.direction == -1:
		sprite.flip_h = true
	
	# Handle animations with priority system
	# Priority: attack > jump/fall > move > idle
	
	if mc_controller.is_attacking:
		animation_player.play("attack")
	elif mc_controller.velocity.y < 0.0:
		animation_player.play("jump")
	elif mc_controller.velocity.y > 0.0:
		animation_player.play("fall")
	elif abs(mc_controller.velocity.x) > 0.0:
		animation_player.play("move")
	else:
		animation_player.play("idle")
