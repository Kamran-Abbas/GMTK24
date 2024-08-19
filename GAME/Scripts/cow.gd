extends Node2D

const SCALE = 0.7
var collectionNumber
var currentCollNumber
var withPlayer = false
var direction = 1
var startedMoving = false

@onready var drct = $AnimatedSprite2D
@onready var cow = $"."
@onready var rayright = $RayRight
@onready var rayleft = $RayLeft

func _process(delta):
	currentCollNumber = AnimalCollection.collectionNumber
	if !AnimalCollection.endOfLevel:
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
	else:
		if (collectionNumber == currentCollNumber) or (startedMoving):
			startedMoving = true
			cow.scale.y = SCALE
			cow.scale.x = SCALE
			direction = 1
			drct.flip_h = false
			AnimalCollection.animalsMoving = true
			position.y = PlayerTracker.playerPos.y - 10
			position.x += direction * 50 * delta
	
func _on_area_2d_body_entered(_body):
	Counter.addCow()
	cow.scale.y = 0.01
	cow.scale.x = 0.01
	withPlayer = true
	collectionNumber = AnimalCollection.collectionNumber
	AnimalCollection.incrCollNum()
	get_node("PlayerArea2D").queue_free()
