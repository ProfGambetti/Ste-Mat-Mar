extends Area2D

@export var next_room: PackedScene
var is_unlocked = false

func _ready():
	body_entered.connect(_on_body_entered)
	# DoorBlocker inizia attivo (blocca)
	$DoorBlocker.set_collision_layer_value(1, true)

func unlock():
	is_unlocked = true
	
	# DISABILITA il blocco fisico
	$DoorBlocker.set_collision_layer_value(1, false)
	
	# Suono di sblocco
	$AudioStreamPlayer2.play()
	print("Porta sbloccata!")

func _on_body_entered(body):
	if body.name == "Player":
		if is_unlocked:
			print("Cambio stanza!")
			change_room()
		else:
			print("Porta chiusa! Trova la chiave.")

func change_room():
	if next_room:
		get_tree().change_scene_to_packed(next_room)
	else:
		print("ERRORE: next_room non impostata!")
