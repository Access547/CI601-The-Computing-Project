extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	for i in combat.enemies.size():
		combat.enemies.front().health -= 7
		combat.get_node(str("enemy", i)).PlayAnim("Fireball")
		combat.sfx.PlaySound(load("res://Assets/Sound/fireball sound.wav"))
	combat.ResolveTurn()

func SetUp(combat: CombatManager):
	Activate(null, combat.grid, combat)
	combat.selectingMenuItem = false
