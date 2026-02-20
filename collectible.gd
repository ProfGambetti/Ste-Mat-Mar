extends Area2D

signal collected  # Segnale per avvisare la stanza

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("Oggetto raccolto!")
		collected.emit()  # Avvisa che è stato raccolto
		queue_free()  # Distruggi l'oggetto
