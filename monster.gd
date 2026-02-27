extends CharacterBody2D

const SPEED = 120.0
var player = null
var active = true

func _ready():
	player = get_node("/root/Room1/Player")
	print("Player trovato: ", player)

func _physics_process(delta):
	if not active or player == null:
		return
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	move_and_slide()

func _on_hitbox_body_entered(body):
	if body == player and active:
		active = false
		velocity = Vector2.ZERO
		get_node("/root/Room1").trigger_jumpscare()
