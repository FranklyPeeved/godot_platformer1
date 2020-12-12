extends Control



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var text=""
	for i in range(Globals.scores.size()):
		text = text + pad_name(Globals.names[i])
		text = text + " " + str(Globals.scores[i])
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


func _on_button3_pressed():
	Globals.reset()
	_ready()
