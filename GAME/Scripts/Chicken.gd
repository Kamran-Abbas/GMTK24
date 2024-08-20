extends Node2D


const SCALE = 0.7
var WEIGHT
var collectionNumber
var direction = 1
var withPlayer = false
var currentCollNumber
var startedMoving = false

@onready var drct = $AnimatedSprite2D
@onready var chicken = $"."

@onready var rayright = $rayright
@onready var rayleft = $rayleft

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
				chicken.scale.y = SCALE
				chicken.scale.x = SCALE
				direction = 1
				drct.flip_h = false
				AnimalCollection.animalsMoving = true
				position.x += direction * 50 * delta



func _on_area_2d_body_entered(_body):
	chicken.scale.x = 0.01
	chicken.scale.y = 0.01
	withPlayer = true
	collectionNumber = AnimalCollection.collectionNumber
	AnimalCollection.incrCollNum()
	Counter.currentWeight += WEIGHT
	Counter.totalAnimals += 1
	get_node("PlayerArea2D").queue_free()
	
