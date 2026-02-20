extends Node2D


func _on_collectible_collected():
	$UI/CollectibleLayer.text = "Oggetto raccolto: CHIAVE"  # ← Cambiato qui
	await get_tree().create_timer(2.0).timeout
	$UI/CollectibleLayer.text = ""
