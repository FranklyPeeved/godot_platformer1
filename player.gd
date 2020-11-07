extends KinematicBody2D

# HELLO comment from Richard

var velocity = Vector2(0,0)
var jump_timer = 0
var lives = 3

func _physics_process(delta):
	if is_on_floor():
		$alien_pink.animation = 'idle_front'
		jump_timer = 0.5
		if Input.is_action_pressed('right'):
			velocity.x += 30
			$alien_pink.animation = 'walk'
		elif Input.is_action_pressed("left"):
			velocity.x -= 30
			$alien_pink.animation = 'walk'
		else:
			velocity.x = lerp(velocity.x, 0, 0.1)
	else:
		$alien_pink.animation = 'jump'
		if Input.is_action_pressed('right'):
			velocity.x += 30
		elif Input.is_action_pressed('left'):
			velocity.x -= 30
	velocity.x = clamp(velocity.x, -300, 300)
	velocity.y += 20
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if jump_timer > 0:
		jump_timer -= delta
		if Input.is_action_pressed('jump'):
			velocity.y = -300
			if not $phaseJump1.playing: $phaseJump1.play()

	$alien_pink.flip_h = velocity.x < 0
	
	if position.y>700:
		kill()

	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.has_method("kill"):
			if position.y < collider.position.y - 10:
				velocity.y = -600
				collider.kill()

var respawn_position = Vector2(200,250)

func kill():
	position = respawn_position
	lives = lives - 1
	get_node("../HUD//lives").text = str(lives)
	if lives == 0:
		get_tree().change_scene("res://gameover.tscn")

func inc_lives():
	lives = lives + 1
	get_node("../HUD//lives").text = str(lives)


func _on_winflag_body_entered(body):
	if body == self:
		get_tree().change_scene("res://winningscreen.tscn")



func _on_redflag_body_entered(body):
	print("respawn point")
	if body == self:
		respawn_position = position
