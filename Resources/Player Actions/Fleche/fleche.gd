extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	var pos = combat.turnOrder.front().gridPos

	if pos == 0 or 2 or 4 or 6:
		if combat.grid[pos + 1].character == null:
			combat.MoveCharacterGrid(combat.turnOrder.front(), pos + 1)
			target.health -= 10
	else:
		target.health -= 3
	combat.sfx.PlaySound(load("res://Assets/Sound/swing sound.wav"))

func SetUp(combat: CombatManager):
	combat.selectingEnemies = true
	combat.selectingMenuItem = false
