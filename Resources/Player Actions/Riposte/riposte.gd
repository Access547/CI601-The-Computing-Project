extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	target.health -= grid[combat.turnOrder.front().gridPos].CalcTotalDamage()
	combat.sfx.PlaySound(load("res://Assets/Sound/swing sound.wav"))


func SetUp(combat: CombatManager):
	combat.selectingEnemies = true
	combat.selectingMenuItem = false