extends Area2D

signal hit
var life_mob = 100
@export var runSpeed = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@onready var pathfollw = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pathfollw.progress += runSpeed *delta

func degat(point):
	life_mob -= point
	if life_mob <= 0:
		queue_free()
	return life_mob
	
func _on_body_entered(body):
	hit.emit()
