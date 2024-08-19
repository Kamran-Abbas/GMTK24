extends Node
@onready var game_manager = %GameManager

var collectionNumber = 0
var lastCollection
var endOfLevel = false
var animalsMoving = false
var timerEnded = false
var startTimer = false
var finishedCounting = false

func collectAnimal():
	endOfLevel = true
	lastCollection = collectionNumber
	for i in lastCollection:
		collectionNumber = i
		print(collectionNumber)
		await get_tree().create_timer(0.4).timeout
	finishedCounting = true
	

func incrCollNum():
	collectionNumber += 1
	print(collectionNumber)
