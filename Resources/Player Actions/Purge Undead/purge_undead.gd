extends Action


@export var name: String = "Action"
@export var description: String = "An Action"
@export var targetType: int = 0 #0 Is no targetting, 1 is target enemies, 2 is target allies
@export var animType: String = "Attack"

func Activate(target: Character, grid: Array[GridInfo], combat: CombatManager) -> void:
	var count: int = 0
	for i in combat.enemies.size():
		if combat.enemies[i].is_in_group("Undead"):
			count += 1
			
	if count == combat.enemies.size():
		for i in combat.enemies.size():
			combat.enemies.front().health -= 999
			#combat.get_node(str("enemy", str(combat.enemies[i].gridPos))).PlayAnim("Purge Undead")
			combat.sfx.PlaySound(load("res://Assets/Sound/fireball sound.wav"))
	
	combat.ResolveTurn()


func SetUp(combat: CombatManager):
	Activate(null, combat.grid, combat)
	combat.selectingMenuItem = false
