extends Node2D


func _ready() -> void:
	DemoLoader.isInDemo = true
	
	if BattleInit.savedPlayerPos:
		$Player.position = BattleInit.savedPlayerPos

	
	if !DemoLoader.demoEnemies[0]:
		$"Archer Enemy".queue_free()
	if !DemoLoader.demoEnemies[1]:
		$"Goblin Enemy".queue_free()


func SwapScenes():
	get_tree().change_scene_to_file("res://Combat Manager/combat_level.tscn")
