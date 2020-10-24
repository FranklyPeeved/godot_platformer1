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
		text = text + names[i]
		text = text + " " + str(scores[i])
		text = text + '\n'
		
	print(text)
	$leaderboard.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
