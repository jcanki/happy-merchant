extends Control

func _on_btnstart_pressed() -> void:
	# Mengarahkan pemain ke scene tutorial sang ibu
	# PENTING: Pastikan letak dan nama file tutorial kamu sudah sama persis dengan yang di bawah
	get_tree().change_scene_to_file("res://scenes/tutorial_game.tscn")

func _on_btnexit_pressed() -> void:
	# Keluar dari game secara total
	get_tree().quit()
