extends Node

var collectionNumber = 0
var lastCollection
var endOfLevel = false
var animalsMoving = false
var timerEnded = false
var startTimer = false

func collectAnimal():
	endOfLevel = true
	lastCollection = collectionNumber
	for i in lastCollection:
		collectionNumber = i
		print(collectionNumber)
		await get_tree().create_timer(0.4).timeout
			
	

func incrCollNum():
	collectionNumber += 1
	print(collectionNumber)
