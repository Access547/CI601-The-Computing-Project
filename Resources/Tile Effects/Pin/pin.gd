extends TileEffect


var damageDealt: int
var healingDealt: int
var owner: Enemy
var pinning: bool = true


func Activate(char: Character) -> void:
	char.isPinned = pinning
