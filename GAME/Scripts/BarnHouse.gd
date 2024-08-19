extends Node2D

@onready var game_manager = %GameManager

var animal
var mass

func _on_area_2d_body_exited(body):
	print("Body entered")
	body.queue_free()


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("Area entered")
	animal = area.get_parent()
	mass = animal.get_node("Weight").get_meta("Weight")
	game_manager.add_mass(mass)
	animal.free()
