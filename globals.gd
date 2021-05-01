extends Node

var scores = [99]
var names = ["Michael"]
var score = 0
var timer = 0
var touch_controls = false

func _init():
	print("loading")
	#save()
	load_scores()
	load_options()

func save_scores():
	var file = File.new()
	file.open("user://game.dat", File.WRITE)
	file.store_var(names)
	file.store_var(scores)
	file.close()
	
func save_options():
	var file = File.new()
	file.open("user://options.dat", File.WRITE)
	file.store_var(touch_controls)
	file.close()

func load_scores():
	var file = File.new()
	var err = file.open("user://game.dat", File.READ)
	if err != OK:
		print("error loading scores")
	else:
		names = file.get_var()
		scores = file.get_var()
	file.close()
	bubble_sort()
	
func load_options():
	var file = File.new()
	var err = file.open("user://options.dat", File.READ)
	if err != OK:
		print("error loading options")
	else:
		touch_controls = file.get_var()
	file.close()
	
func reset():
	scores = []
	names = []
	save_scores()
	
func bubble_sort():
	for passnum in range(len(scores)-1,0,-1):
		for i in range(passnum):
			if scores[i]<scores[i+1]:
				var temp = scores[i]
				scores[i] = scores[i+1]
				scores[i+1] = temp
				temp = names[i]
				names[i] = names[i+1]
				names[i+1] = temp

