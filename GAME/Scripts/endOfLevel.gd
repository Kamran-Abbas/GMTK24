extends Node2D
@onready var timer = $Timer


func _on_area_2d_body_entered(body):
	if !AnimalCollection.endOfLevel:
		AnimalCollection.endOfLevel = true
		AnimalCollection.collectAnimal()

	

