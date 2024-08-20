extends Node2D

@onready var game_manager = %GameManager

var animal
var mass


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Area entered")
	animal = area.get_parent()
	mass = animal.get_node("Weight").get_meta("Weight")
	game_manager.add_mass(mass)
	animal.free()
	if AnimalCollection.finishedCounting:
		await get_tree().create_timer(2).timeout
		game_manager.winOrLose(game_manager.scaleMass, game_manager.targetWeight, game_manager.HigherTMass, game_manager.LowerTMass)
