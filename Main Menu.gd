extends Control




func _on_to_demo_pressed() -> void:
	get_tree().change_scene_to_file("res://Demo stuff/demo_level.tscn")
	for i in DemoLoader.demoEnemies.size():
		DemoLoader.demoEnemies[i] = true
		BattleInit.savedPlayerPos = Vector2.ZERO


func _on_to_editor_pressed() -> void:
	get_tree().change_scene_to_file("res://Custom menu/battle_creation_menu.tscn")


func _on_to_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://GUI/tutorial.tscn")
