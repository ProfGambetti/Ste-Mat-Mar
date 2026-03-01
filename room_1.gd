extends Node2D

# Riferimento alla scena del jumpscare
@onready var jumpscare = $Jumpscare

# Chiamata quando il collectible originale viene raccolto
func _on_collectible_collected():
	print("collectible raccolto!")
	
	# Mostra il testo di raccolta per 2 secondi
	$UI/CollectibleLayer.text = "Oggetto raccolto: CHIAVE"
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""
	
	# Sblocca la porta di uscita
	$ExitDoor.unlock()
	
	# Mostra il testo di porta sbloccata per 2 secondi
	$UI/CollectibleLayer.text = "Porta sbloccata!"
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""

# Attiva il jumpscare quando il mostro tocca il player
func trigger_jumpscare():
	jumpscare.play_jumpscare()

# Chiamata quando il collectible2 viene raccolto (stesso comportamento)
func _on_collectible_2_collected() -> void:
	print("collectible raccolto!")
	
	# Mostra il testo di raccolta per 2 secondi
	$UI/CollectibleLayer.text = "Oggetto raccolto: CHIAVE"
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""
	
	# Sblocca la porta di uscita
	$ExitDoor.unlock()
	
	# Mostra il testo di porta sbloccata per 2 secondi
	$UI/CollectibleLayer.text = "Porta sbloccata!"
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""
