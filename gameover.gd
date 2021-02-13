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
	var url = "http://dreamlo.com/lb/prdd8D1dfEiPzmHRc_Kt4Q3DCauo0KUEqL07PHdniISg/add/"
	url += new_text.percent_encode()+"/"+str(Globals.score)
	url += "/"+str(Globals.timer)
	print(url)
	$http_request.request(url)
	


func _on_http_request_request_completed(result, response_code, headers, body):
	print(result, response_code)
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://onlinescores.tscn")
