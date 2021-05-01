extends Control



func _on_check_button_toggled(button_pressed):
	print(button_pressed)
	Globals.touch_controls = button_pressed


func _on_button_pressed():
	Globals.save_options()
	get_tree().change_scene("res://title_screen.tscn")

func _ready():
	$check_button.pressed = Globals.touch_controls
