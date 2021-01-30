extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_line_edit_text_entered(new_text):
	print (new_text)
	Globals.names.append(new_text)
	Globals.scores.append(Globals.score)
	Globals.save_scores()
	var url = "http://dreamlo.com/lb/prdd8D1dfEiPzmHRc_Kt4Q3DCauo0KUEqL07PHdniISg/add/"+new_text+"/"+str(Globals.score)
	print(url)
	$http_request.request(url)
	get_tree().change_scene("res://onlinescores.tscn")


func _on_http_request_request_completed(result, response_code, headers, body):
	print(result, response_code)
