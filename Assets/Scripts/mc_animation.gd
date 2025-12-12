extends Node2D

@export var mc_controller :  MCController
@export var animation_player : AnimationPlayer
@export var  sprite : Sprite2D

func  _process(delta):
	#flip char
	if mc_controller.direction == 1:
		sprite.flip_h = false
	elif  mc_controller.direction == -1:
		sprite.flip_h = true
		
	# Handle attack animation (priority)
	if mc_controller.is_attacking:
		animation_player.play("attack")
		return
#movement animation
	if abs(mc_controller.velocity.x) > 0.0 :
		animation_player.play("move")
	else :
		animation_player.play("idle")
	#jump
	if mc_controller.velocity.y < 0.0:
		animation_player.play("jump")
	elif mc_controller.velocity.y >0.0:
		animation_player.play("fall")
