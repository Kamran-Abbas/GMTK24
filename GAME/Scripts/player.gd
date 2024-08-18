extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D

var player_dead = false

func _process(body):
	
	PlayerTracker.playerPos.y = position.y
	PlayerTracker.playerPos.x = position.x + 50
	
	if Engine.time_scale == 0.5:
		player_dead = true
		animated_sprite_2d.play("death")
		velocity.x = 0
	
		#pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if !player_dead:
		if !AnimalCollection.endOfLevel:
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				
			var direction = Input.get_axis("left", "right")
			
			if is_on_floor():
				if direction == 0:
					animated_sprite_2d.play("idle")
				else:
					animated_sprite_2d.play("run")
			else:
				animated_sprite_2d.play("jump")
				
			if direction == -1:
				animated_sprite_2d.flip_h = true
				velocity.x = direction * SPEED
			elif direction == 1:
				animated_sprite_2d.flip_h = false
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			velocity.x = 0
			animated_sprite_2d.play("idle")

	move_and_slide()
	
	
	

	
