extends CharacterBody2D


const SPEED = 400
signal sord_hit
@export var life = 100

var input_direction: get = _get_input_direction
var sprite_direction
var in_actater =false
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	if Input.is_action_pressed("sword"):
		in_actater  = true
		sprite.play("attaque")
	elif in_actater == false:
		sprite.play("default")
	velocity = input_direction *SPEED
	move_and_slide()

func  _get_input_direction():
	var x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	var y = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	input_direction = Vector2(x,y).normalized()
	return input_direction

func degat(point):
	life -= point
	if life <= 0:
		
		queue_free()
	return life

func _on_animated_sprite_2d_animation_finished():
	in_actater = false

func _on_area_2d_area_entered():
	print("dldfjj")
	sord_hit.emit()
