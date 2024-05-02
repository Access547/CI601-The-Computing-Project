extends CharacterBody2D


var moveSpeed = 75
@onready var animPlayer: AnimationPlayer = $AnimationPlayer


func _process(delta):
	
	var directionX = Input.get_axis("Left", "Right")
	if directionX:
		velocity.x = directionX * moveSpeed
		if directionX < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
	else:
		velocity.x = 0
		
	var directionY = Input.get_axis("Up", "Down")
	if directionY:
		velocity.y = directionY * moveSpeed
	else:
		velocity.y = 0
		
	if velocity != Vector2.ZERO:
		animPlayer.play("Moving")
	else:
		animPlayer.play("Idle")
		
	move_and_slide()
