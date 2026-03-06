extends CharacterBody2D

# Velocità di inseguimento del mostro
const SPEED = 180.0

# Riferimento al player
var player = null

# Se false il mostro si ferma
var active = true

# Riferimento al NavigationAgent2D
@onready var nav_agent = $NavigationAgent2D

func _ready():
	# Cerca il player nella scena
	player = get_node("/root/Room1/Player")
	print("Player trovato: ", player)

func _physics_process(delta):
	if not active or player == null:
		return
	
	# Aggiorna la destinazione del NavigationAgent verso il player
	nav_agent.target_position = player.global_position
	
	# Calcola la direzione verso il prossimo punto del percorso
	var next_point = nav_agent.get_next_path_position()
	var direction = (next_point - global_position).normalized()
	
	velocity = direction * SPEED
	move_and_slide()

func _on_hitbox_body_entered(body):
	if body == player and active:
		active = false
		velocity = Vector2.ZERO
		get_node("/root/Room1").trigger_jumpscare()
