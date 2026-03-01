extends Area2D

# Indica se la porta è sbloccata o meno
var is_unlocked = false

func _ready():
	# Collega il segnale body_entered alla funzione di gestione
	body_entered.connect(_on_body_entered)
	# All'avvio il DoorBlocker è attivo e blocca il passaggio
	$DoorBlocker.set_collision_layer_value(1, true)

func unlock():
	# Sblocca la porta e disabilita il blocco fisico
	is_unlocked = true
	$DoorBlocker.set_collision_layer_value(1, false)
	print("Porta sbloccata!")

func _on_body_entered(body):
	# Quando il player entra nella porta
	if body.name == "Player":
		if is_unlocked:
			print("Vittoria!")
			change_room()
		else:
			print("Porta chiusa! Trova la chiave.")

func change_room():
	# Carica la schermata di vittoria
	get_tree().change_scene_to_file("res://victory.tscn")
