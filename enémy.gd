extends Area2D


@export var runSpeed = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@onready var pathfollw = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pathfollw.progress += runSpeed *delta

func _on_body_entered(body):
	queue_free()

func _on_body_exited(body):
	queue_free()
