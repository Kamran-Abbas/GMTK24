extends Node2D

const SCALE = 0.6
var WEIGHT
var collectionNumber
var direction = 1
var withPlayer = false
var currentCollNumber
var startedMoving = false

@onready var drct = $AnimatedSprite2D
@onready var pig = $"."
@onready var rayright = $RayRight
@onready var rayleft = $RayLeft

func _ready():
	WEIGHT = get_node("Weight").get_meta("Weight")

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
				pig.scale.y = SCALE
				pig.scale.x = SCALE
				direction = 1
				drct.flip_h = false
				AnimalCollection.animalsMoving = true
				position.y = PlayerTracker.playerPos.y - 5
				position.x += direction * 50 * delta
				
func _on_area_2d_body_entered(body):
	Counter.addPig()
	pig.scale.y = 0.01
	pig.scale.x = 0.01
	withPlayer = true
	collectionNumber = AnimalCollection.collectionNumber
	AnimalCollection.incrCollNum()
	Counter.currentWeight += WEIGHT
	get_node("PlayerArea2D").queue_free()
