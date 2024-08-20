extends Area2D

@onready var restart_timer = $RestartTimer
@onready var death_anim_timer = $DeathAnimTimer

var playerBody


func _on_body_entered(body):
	death_anim_timer.start()
	restart_timer.start()
	Engine.time_scale = 0.5
	playerBody = body

func _on_death_anim_timer_timeout():
	playerBody.get_node("CollisionShape2D").queue_free()


func _on_restart_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/lose.tscn")
