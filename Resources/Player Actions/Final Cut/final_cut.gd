extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	if combat.enemies.size() == 1:
		combat.enemies.front().health -= 999
		combat.sfx.PlaySound(load("res://Assets/Sound/swing sound.wav"))


func SetUp(combat: CombatManager):
	Activate(null, combat.grid, combat)
