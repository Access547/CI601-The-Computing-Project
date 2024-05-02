extends RichTextLabel


@export var combat: CombatManager
@export var pos: int


func _ready() -> void:
	if combat.grid[pos].CalcTotalDamage() > 0:
		text = str(combat.grid[pos].CalcTotalDamage())
	else:
		text = ""

func Update() -> void:
	if combat.grid[pos].CalcTotalDamage() > 0:
		text = str(combat.grid[pos].CalcTotalDamage())
	else:
		text = ""



