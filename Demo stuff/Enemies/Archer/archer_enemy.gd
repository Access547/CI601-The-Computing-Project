extends Node2D


@export var enemyArray: Array[PackedScene]
@export var place: int

func _on_area_2d_body_entered(body: Node2D) -> void:
	#Fills enemy array 
	BattleInit.enemyArray.clear()
	BattleInit.enemyArray.append_array(enemyArray)
	$"../CanvasLayer/Panel/AnimationPlayer".play("Fade in")
	BattleInit.savedPlayerPos = $"../Player".position
	DemoLoader.demoEnemies[place] = false
	queue_free()
