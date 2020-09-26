extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start_color = Color.white
var end_color = Color.royalblue

# Called when the node enters the scene tree for the first time.
func _ready():
	$color_rect.color = start_color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$color_rect.color = lerp($color_rect.color, end_color, 0.003)


func _on_button_pressed():
	get_tree().change_scene("res://main.tscn")
