extends Control

var scores = [5, 10, 20]
var names = ["john", "fred", "richard"]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var text=""
	for i in range(scores.size()):
		text = text + pad_name(names[i])
		text = text + " " + str(scores[i])
		text = text + '\n'
		
	print(text)
	$leaderboard.text = text

func pad_name(name):
	var x
	x = 10 - len(name)
	for i in range (x):
		name = name + " "
	return name

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button2_pressed():
	get_tree().change_scene("res://title_screen.tscn")
