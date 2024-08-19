extends Node


@onready var label = $Label

var scaleMass = 0

func add_mass(weight):
	scaleMass += weight
	label.text = str(scaleMass) + " KG"
