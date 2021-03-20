extends Control

var scroll = 0

func _ready():
	print ("hello")
	var a = [1, 5, 7]

	
	
	for i in a.size():
		print("index ",i, "value ", a[i])
		
	
	$http_request.request("http://dreamlo.com/lb/600c00958f40bb2a7019bbe2/json")
	print("request sent")

var scores

func _on_http_request_request_completed(result, response_code, headers, body):
	print("result:", result)
	print (response_code)
	var json = JSON.parse(body.get_string_from_utf8())
	scores  = json.result["dreamlo"]["leaderboard"]["entry"]
	update()
	
func update():
	print("update called, scroll is ", scroll)
	var text=""
	for index in scores.size():
		if index < scroll:
			continue
		var element = scores[index]
		#print("ELEMENT ",element)
		if element is String:
			print("shouldnt be a string, only 1 score?")
			text="Need more scores"
		else:
			text = text + pad(str(index + 1), 4)
			text = text + pad_name(str(element["name"]))
			text = text + pad_number(str(element["score"]))
			text = text + pad_number(str(element["seconds"]))
			text = text + '\n'
			#print(text)
	
	$leaderboard.text = text

func pad_name(name):
	var x
	x = 10 - len(name)
	for i in range (x):
		name = name + " "
	return name

func pad_number(name):
	var x
	x = 4 - len(name)
	for i in range (x):
		name = name + " "
	return name

func pad(name, max_padding):
	var x
	x = max_padding - len(name)
	for i in range (x):
		name = name + " "
	return name

func _on_button2_pressed():
	get_tree().change_scene("res://title_screen.tscn")


func _on_button_pressed():
	print("pressed")


func _on_button_button_down():
	scroll -= 1
	if scroll <= 0:
		scroll = 0
	print("down ", scroll)
	update()


func _on_button3_button_down():
	scroll += 1
	if scroll >= scores.size() - 5:
		scroll = scores.size() - 5
	print("up ", scroll)
	update()
