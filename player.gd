extends CharacterBody2D
const SPEED = 200.0
@onready var animated_sprite = $AnimatedSprite2D
var last_direction = "down"

func _ready():
	animated_sprite.play("standing_down")

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x < 0:
				animated_sprite.play("run_left")
				last_direction = "left"
			else:
				animated_sprite.play("run_right")
				last_direction = "right"
		else:
			if direction.y < 0:
				animated_sprite.play("run_up")
				last_direction = "up"
			else:
				animated_sprite.play("run_down")
				last_direction = "down"
	else:
		match last_direction:
			"up":
				animated_sprite.play("standing_up")
			"down":
				animated_sprite.play("standing_down")
			"left":
				animated_sprite.play("standing_left")
			"right":
				animated_sprite.play("standing_right")
	
	move_and_slide()
