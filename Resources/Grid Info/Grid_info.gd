extends Resource
class_name GridInfo


var character: Character #Determines the character within the grid space. If no character, the value is null
var tileEffect: Array[TileEffect] #Determines what damage effect is set on the space, if no effect, the value is null


func AddNewEffect(effect: TileEffect) -> void:
	tileEffect.append(effect)


func CalcTotalDamage() -> int:
	if tileEffect.size() > 0:
		var totalDamage: int
		for i in tileEffect.size():
			totalDamage += tileEffect[i].damageDealt
		
		return totalDamage
	else:
		return 0
