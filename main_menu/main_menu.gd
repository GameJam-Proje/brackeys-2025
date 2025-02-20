extends Control


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_load_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/load_game_menu.tscn")

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu/settings_menu.tscn")
