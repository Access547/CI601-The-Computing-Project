extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	for i in combat.characters.size():
		combat.characters[i].buffDamage += 3
		combat.get_node(str(combat.characters[i].gridPos)).PlayAnim("Boost")
		combat.sfx.PlaySound(load("res://Assets/Sound/tp sound.wav"))

	combat.ResolveTurn()


func SetUp(combat: CombatManager):
	Activate(null, combat.grid, combat)
