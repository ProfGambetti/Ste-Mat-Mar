extends Control

# Quando il pulsante "RIPROVA" viene premuto, ricarica la scena di gioco
func _on_button_pressed():
	get_tree().change_scene_to_file("res://room_1.tscn")
