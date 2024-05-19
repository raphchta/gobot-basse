extends CharacterBody2D

signal  hit_p
const SPEED = 400
@export var life = 100

var sprite_direction
var in_actater = false
var in_reing = false
@onready var sprite = $AnimatedSprite2D


func _physics_process(delta):
	var input_direction
	if in_reing:
		var x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
		var y = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
		input_direction = Vector2(x,y).normalized()
		if y == -1:
			rotation = 0
		elif y == 1 :
			rotation = PI
		if x == -1:
			rotation = -PI/2
		elif x == 1 :
			rotation = PI/2
		if x == 1 and y == 1:
			rotation = 3 * PI / 4
		elif x == -1 and y == 1:
			rotation = -3 * PI / 4
		elif x == 1 and y == -1:
			rotation = PI / 4
		elif x == -1 and y == -1:
			rotation = -PI / 4
		if Input.is_action_pressed("sword"):
			in_actater  = true
			sprite.play("attaque")
		else:
			in_actater  = false
			sprite.play("default")
	else:
		input_direction = Vector2(0,0).normalized()
	velocity = input_direction *SPEED
	move_and_slide()

func degat(point):
	if in_reing:
		life -= point
		if life <= 0:
			hide() # Player disappears after being hit.
			$CollisionShape2D.set_deferred("disabled", true)		
	return life


func _on_area_2d_area_entered(area):
	if in_actater:
		hit_p.emit()
		
func strat():
	position = Vector2(851,432)
	$CollisionShape2D.disabled = false
	in_reing = true
	show()
	rotation = PI
	life = 100
	return life
