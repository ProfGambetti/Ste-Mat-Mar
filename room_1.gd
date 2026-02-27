extends Node2D

@onready var jumpscare = $Jumpscare

func _on_collectible_collected():
	$UI/CollectibleLayer.text = "Oggetto raccolto: CHIAVE"
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""
	$ExitDoor.unlock()
	
	$UI/CollectibleLayer.text = "Porta sbloccata!"
	await get_tree().create_timer(2.0).timeout
	
	# Cancella testo
	$UI/CollectibleLayer.text = ""

func trigger_jumpscare():
	jumpscare.play_jumpscare()
