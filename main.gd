extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mob_hit():
	var life = $Player.degat(50)
	$HUD.update_score(life)
	if life <= 0:
		$HUD.show_game_over()
		$Player.in_reing = false
		$Player.life = 100

func _on_player_hit_p():
	$Path2D/PathFollow2D/mob.degat(50)

func _on_hud_start_game():
	var life = $Player.strat()
	$HUD.update_score(life)
	
