extends Action

@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	var bonusDamage: int
	if combat.turnOrder[0].gridPos % 2 == 0:
		bonusDamage = 0
	else:
		bonusDamage = 5
	target.health -= 5 + bonusDamage
	
	bonusDamage = 0
	combat.sfx.PlaySound(load("res://Assets/Sound/swing sound.wav"))


func SetUp(combat: CombatManager):
	combat.selectingEnemies = true
	combat.selectingMenuItem = false
