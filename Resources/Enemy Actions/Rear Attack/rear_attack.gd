extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:
	var newEffect: TileEffect = effect.duplicate()
	newEffect.damageDealt = 3
	newEffect.owner = owner
	newEffect.resource_name = str(owner)
	grid[0].AddNewEffect(newEffect)
	grid[2].AddNewEffect(newEffect)
	grid[4].AddNewEffect(newEffect)
	grid[6].AddNewEffect(newEffect)
	
	
