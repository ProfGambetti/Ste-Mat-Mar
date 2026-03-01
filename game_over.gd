extends Control

# Quando il pulsante "PLAY" viene premuto, carica la scena di gioco
func _on_button_pressed():
	get_tree().change_scene_to_file("res://room_1.tscn")
