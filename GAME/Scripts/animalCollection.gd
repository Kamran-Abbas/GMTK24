extends Node

var collectionNumber = 1
var lastCollection
var endOfLevel = false
var animalsMoving = false

func collectAnimal():
	endOfLevel = true
	lastCollection = collectionNumber - 1
	for i in lastCollection:
		collectionNumber = i
		for j in 100:
			if j == 100:
				pass
	

func incrCollNum():
	collectionNumber += 1
	print(collectionNumber)
