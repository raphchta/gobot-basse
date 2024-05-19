extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	
func show_game_over():
	show_message("Game Over")
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	start_game.emit()

