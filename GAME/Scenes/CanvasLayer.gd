extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Hide world nodes
	$World.visible = false
	
	$AnimationPlayer.play("FadeIn")
	
	get_tree().create_timer(6)
	$AnimationPlayer.play("FadeOut")
	
	# After fade-out, show world nodes
	$World.visible = true
