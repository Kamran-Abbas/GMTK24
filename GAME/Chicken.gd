extends Node2D

var direction = 1

@onready var drct = $AnimatedSprite2D

@onready var rayright = $rayright
@onready var rayleft = $rayleft

func _process(delta):
	if rayright.is_colliding():
		direction = 1
		drct.flip_h = true
	if rayleft.is_colliding():
		direction = -1
		drct.flip_h = false
	position.x += direction *  60 * delta
