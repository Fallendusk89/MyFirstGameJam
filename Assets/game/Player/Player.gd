extends CharacterBody2D

@export var gravity = 325
@export var speed = 125
@export var jump_force = 175
@export var health = 100

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force 
	
	var direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * speed
	move_and_slide()
	
	


func _process(_delta):
	
	
	
	if Input.is_action_just_pressed("sprint") and $Timer.is_stopped() :
		speed = 200
		print(speed)
		$Timer.start()
	
	
	$ProgressBar.set_value_no_signal(true)
	$ProgressBar.value = health



func _on_timer_timeout():
	$Timer.stop() 
	$Timer.wait_time = 1
	speed = 120
