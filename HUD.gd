extends CanvasLayer


func inc_score():
	set_score(Globals.score + 1)
	
func set_score(s):
	Globals.score = s
	$score.set_text(str(Globals.score))

func _on_left_button_pressed():
	Input.action_press("left")

func _on_left_button_released():
	Input.action_release("left")

func _on_right_button_pressed():
	Input.action_press("right")

func _on_right_button_released():
	Input.action_release("right")

func _on_jump_button_pressed():
	Input.action_press("jump")

func _on_jump_button_released():
	Input.action_release("jump")





func _on_timer_timeout():
	Globals.timer = Globals.timer + 1
	print(Globals.timer)
	$time.set_text(convertSecondsToClock(Globals.timer))
	
func convertSecondsToClock(time):
	var minutes = str(time/60)
	var seconds = str(time % 60)
	if time % 60 < 10:
		seconds = "0"+seconds
	if time/60 < 10:
		minutes = "0"+minutes
	return minutes + ":" + seconds
