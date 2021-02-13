extends Control

func _ready():
	print ("hello")
	$http_request.request("http://dreamlo.com/lb/600c00958f40bb2a7019bbe2/json")
	print("request sent")


func _on_http_request_request_completed(result, response_code, headers, body):
	print("result:", result)
	print (response_code)
	var json = JSON.parse(body.get_string_from_utf8())
	var r = json.result["dreamlo"]["leaderboard"]["entry"]
	print(r)
	var text=""
	
	

	for element in r:
		print("ELEMENT ",element)
		if element is String:
			print("shouldnt be a string, only 1 score?")
			text="Need more scores"
		else:
			text = text + pad_name(str(element["name"]))
			text = text + pad_name(str(element["score"]))
			text = text + pad_name(str(element["seconds"]))
			text = text + '\n'
			print(text)
	
	$leaderboard.text = text

func pad_name(name):
	var x
	x = 10 - len(name)
	for i in range (x):
		name = name + " "
	return name


func _on_button2_pressed():
	get_tree().change_scene("res://title_screen.tscn")
