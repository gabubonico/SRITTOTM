extends Node2D

var player_talked = false
var music = preload("res://resources/instrumental-2_by_the_microphones.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.music(music)
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if not player_talked: 
		get_tree().change_scene("res://scenes/conversation.tscn")
		player_talked = true


func _on_exit_body_entered(body):
	get_tree().change_scene("res://scenes/exit.tscn")
