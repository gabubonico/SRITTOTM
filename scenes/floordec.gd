extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = types[randi() % types.size()]
