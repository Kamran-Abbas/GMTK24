extends Node2D

const weight = 1
var collectionNumber
var direction = 1
var withPlayer = false

@onready var drct = $AnimatedSprite2D
@onready var chicken = $"."

@onready var rayright = $rayright
@onready var rayleft = $rayleft

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	Counter.addChicken()
	chicken.scale.x = 0.01
	chicken.scale.y = 0.01
	withPlayer = true
	collectionNumber = AnimalCollection.collectionNumber
	AnimalCollection.incrCollNum()
	get_node("PlayerArea2D").queue_free()
	
