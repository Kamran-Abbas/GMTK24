extends Node


@onready var label_2 = $Label2
@onready var label = $Label

var scaleMass = 0
var targetWeight = 30
var LowerTMass
var HigherTMass

func _ready():
	#targetWeight = randi_range(1, 50)
	label_2.text = "GET " + str(targetWeight) + " KG OF ANIMALS"

func add_mass(weight):
	scaleMass += weight
	label.text = str(scaleMass) + " KG"

func winOrLose(mass, targetMass, upperBound, lowerBound):
	lowerBound = targetWeight - 2.5
	upperBound = targetWeight + 2.5 
	if ((lowerBound < mass) and (upperBound > mass)):
		Counter.win = true
