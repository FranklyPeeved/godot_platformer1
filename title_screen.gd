extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.score = 0
	Globals.timer = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_pressed():
	get_tree().change_scene("res://main.tscn")


func _on_button2_pressed():
	get_tree().quit()


func _on_button3_pressed():
	get_tree().change_scene("res://scoreboard.tscn")
	
	


func _on_button4_pressed():
	 get_tree().change_scene("res://onlinescores.tscn")


func _on_button5_pressed():
	get_tree().change_scene("res://options.tscn")
