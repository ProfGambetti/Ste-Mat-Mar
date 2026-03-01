extends CanvasLayer

# Riferimenti ai nodi della scena jumpscare
@onready var color_rect = $ColorRect       # Sfondo nero
@onready var texture_rect = $TextureRect   # Immagine spaventosa
@onready var audio = $AudioStreamPlayer    # Suono del jumpscare
@onready var timer = $Timer                # Timer prima di andare al game over

func _ready():
	# All'avvio nasconde tutto, il jumpscare non deve essere visibile
	color_rect.visible = false
	texture_rect.visible = false

func play_jumpscare():
	print("jumpscare avviato!")
	# Mostra lo sfondo nero e l'immagine spaventosa
	color_rect.visible = true
	texture_rect.visible = true
	# Riproduce il suono del jumpscare
	audio.play()
	# Avvia il timer, dopo 2.5 secondi va alla schermata game over
	timer.start(2.5)

func _on_timer_timeout():
	# Quando il timer finisce, carica la schermata di game over
	get_tree().change_scene_to_file("res://game_over.tscn")
