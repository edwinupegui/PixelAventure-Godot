extends CharacterBody2D

var speed := 120
var direction := 0.
var jump := 250
const gravity := 9

@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D
func _physics_process(delta):
	direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	if direction != 0:
		anim.play("walk")
	else:
		anim.play('idle')
		
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h
		
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= jump
	
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()
