extends Area2D

signal collected

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		# Suono
		$AudioStreamPlayer1.play()
		
		# Nascondi visivamente
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true
		
		collected.emit()
		
		# Aspetta che finisca il suono
		await $AudioStreamPlayer1.finished
		queue_free()
