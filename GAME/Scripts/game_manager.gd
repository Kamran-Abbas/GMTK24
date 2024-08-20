extends Node

@onready var label_3 = $Label3
@onready var label_2 = $Label2
@onready var label = $Label

var scaleMass = 0
var targetWeight = 0
var LowerTMass
var HigherTMass

var pig = 0
var chicken = 0
var cow = 0
var sheep = 0

func _ready():
	
	var targetNode = $"../Animals"
	for child in targetNode.get_children():
		for j in child.get_children():
			if child.name == "Chicken":
				chicken += 1
			if child.name == "Pig":
				pig += 1
			if child.name == "Cow":
				cow += 1
			if child.name == "Sheep":
				sheep += 1
	
	var total = pig + chicken + cow + sheep
	var ranNum = randi_range(1, total)
	
	var i = 0
	while i < ranNum:
		var j = randi_range(1, 4)
		if j == 1:
			if chicken <= 0:
				pass
			else:
				chicken -= 1
				targetWeight += 1
				i += 1
		if j == 2:
			if pig <= 0:
				pass
			else:
				pig -= 1
				targetWeight += 5
				i += 1
		if j == 3:
			if cow <= 0:
				pass
			else:
				cow -= 1
				targetWeight += 10
				i += 1
		if j == 4:
			if sheep <= 0:
				pass
			else:
				sheep -= 1
				targetWeight += 2.5
				i += 1
				
			
	label_2.text = "GET " + str(targetWeight) + " KG OF ANIMALS"
	label.text = "0 KG"

func add_mass(weight):
	scaleMass += weight
	label.text = str(scaleMass) + " KG"

func _process(delta):
	var weight = Counter.currentWeight
	label_3.text = "You currently have" + str(weight) + "KG"
 

func winOrLose(mass, targetMass, upperBound, lowerBound):
	lowerBound = targetWeight - 2.5
	upperBound = targetWeight + 2.5 
	if ((lowerBound < mass) and (upperBound > mass)):
		Counter.win = true
		get_tree().change_scene_to_file("res://Scenes/win.tscn")
