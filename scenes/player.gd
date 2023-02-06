extends KinematicBody2D

export var speed = 400
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed 
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed

	move_and_slide(velocity)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "sidewalk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		if velocity.y < 0:
			$AnimatedSprite.animation = "backwards"
		elif velocity.y > 0:
			$AnimatedSprite.animation = "idle"
	else:
		$AnimatedSprite.animation = "idle"
