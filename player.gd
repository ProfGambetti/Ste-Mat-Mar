extends CharacterBody2D

# Velocità di movimento del player
const SPEED = 200.0

# Riferimento all'AnimatedSprite2D per gestire le animazioni
@onready var animated_sprite = $AnimatedSprite2D

# Ricorda l'ultima direzione per usare l'animazione standing corretta
var last_direction = "down"

func _ready():
	# All'avvio mostra l'animazione ferma verso il basso
	animated_sprite.play("standing_down")

func _physics_process(delta):
	# Legge l'input del giocatore (WASD o frecce)
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		# Il player si sta muovendo
		if abs(direction.x) > abs(direction.y):
			# Movimento orizzontale predominante
			if direction.x < 0:
				animated_sprite.play("run_left")
				last_direction = "left"
			else:
				animated_sprite.play("run_right")
				last_direction = "right"
		else:
			# Movimento verticale predominante
			if direction.y < 0:
				animated_sprite.play("run_up")
				last_direction = "up"
			else:
				animated_sprite.play("run_down")
				last_direction = "down"
	else:
		# Il player è fermo, mostra l'animazione standing nella direzione corretta
		match last_direction:
			"up":
				animated_sprite.play("standing_up")
			"down":
				animated_sprite.play("standing_down")
			"left":
				animated_sprite.play("standing_left")
			"right":
				animated_sprite.play("standing_right")
	
	# Applica il movimento con gestione delle collisioni
	move_and_slide()
