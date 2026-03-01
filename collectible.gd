extends Area2D

# Segnale emesso quando il collectible viene raccolto dal player
signal collected

func _ready():
	# Collega il segnale body_entered alla funzione di gestione
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Debug: stampa il nome del nodo che è entrato nell'area
	print("body entrato: ", body.name)
	
	# Controlla che sia il player ad aver toccato il collectible
	if body.name == "Player":
		# Nasconde visivamente il collectible
		$Sprite2D.visible = false
		# Disabilita la collisione
		$CollisionShape2D.set_deferred("disabled", true)
		# Emette il segnale di raccolta verso la scena principale
		collected.emit()
		# Riproduce il suono di raccolta e aspetta che finisca
		$AudioStreamPlayer1.play()
		await $AudioStreamPlayer1.finished
		# Rimuove il nodo dalla scena
		queue_free()
