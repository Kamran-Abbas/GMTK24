extends Node2D

var withPlayer = false
var direction = 1

@onready var drct = $AnimatedSprite2D
@onready var cow = $"."
@onready var rayright = $RayRight
@onready var rayleft = $RayLeft

func _process(delta):
	if !withPlayer:
		if rayright.is_colliding():
			direction = -1
			drct.flip_h = true
		if rayleft.is_colliding():
			direction = 1
			drct.flip_h = false
		position.x += direction *  60 * delta
	else:
		position = PlayerTracker.playerPos
	
	
func _on_area_2d_body_entered(_body):
	Counter.addCow()
	cow.scale.y = 0.01
	cow.scale.x = 0.01
	withPlayer = true
	get_node("PlayerArea2D").queue_free()
