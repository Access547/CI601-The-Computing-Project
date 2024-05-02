extends Node2D


func _ready() -> void:
	DemoLoader.isInDemo = true
	BattleInit.LoadDefaultChars()
	
	if BattleInit.savedPlayerPos:
		$Player.position = BattleInit.savedPlayerPos

	
	if !DemoLoader.demoEnemies[0]:
		$"Archer Enemy".queue_free()
	if !DemoLoader.demoEnemies[1]:
		$"Goblin Enemy".queue_free()
	if !DemoLoader.demoEnemies[2]:
		$"Orc Thrower Enemy".queue_free()
	if !DemoLoader.demoEnemies[3]:
		$"Zombie Enemy".queue_free()
	if !DemoLoader.demoEnemies[4]:
		$"Ghost Enemy".queue_free()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Main Menu.tscn")

func SwapScenes():
	get_tree().change_scene_to_file("res://Combat Manager/combat_level.tscn")
