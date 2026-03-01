extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var texture_rect = $TextureRect  # oppure $Label se usi testo
@onready var audio = $AudioStreamPlayer
@onready var timer = $Timer

func _ready():
	color_rect.visible = false
	texture_rect.visible = false  # oppure $Label.visible = false

func play_jumpscare():
	color_rect.visible = true
	texture_rect.visible = true  # oppure $Label.visible = true
	timer.start(2.5)

func _on_timer_timeout():
	get_tree().reload_current_scene()
