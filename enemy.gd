extends KinematicBody2D

var direction = Vector2.LEFT
var velocity = Vector2(-50, 0)
var timer = 0
export var TURNING_TIME = 3
export var JUMP_HEIGHT=500
export var GRAVITY=20

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += GRAVITY
	velocity.x = direction.x * 50
	velocity = move_and_slide(velocity, Vector2.UP)
		
	timer = timer + delta
	#print(timer)
	
	if timer >  TURNING_TIME or is_on_wall():
		direction = -direction
		timer = 0
		
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider.has_method("kill"):
			collider.kill()

func kill():
	$pepSound3.play()
	direction = Vector2.ZERO
	$frog.animation = 'dead'
	$collision_shape_2d.disabled = true
	get_node("/root/main/HUD").inc_score()
	GRAVITY=20


func _on_frog_frame_changed():
	if $frog.frame == 1:
		velocity.y = -JUMP_HEIGHT
