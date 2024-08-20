extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("FadeIn")
	get_tree().create_timer(3)
	$AnimationPlayer.play("FadeOut")
