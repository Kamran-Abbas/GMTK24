extends Node2D

var direction = 1

@onready var drct = $AnimatedSprite2D

@onready var rayright = $RayRight
@onready var rayleft = $RayLeft


func _process(delta):
	if rayright.is_colliding():
		direction = -1
		drct.flip_h = true
	if rayleft.is_colliding():
		direction = 1
		drct.flip_h = false
	position.x += direction *  60 * delta

func _on_area_2d_body_entered(body):
	queue_free()
