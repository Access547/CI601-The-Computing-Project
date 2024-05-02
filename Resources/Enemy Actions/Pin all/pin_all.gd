extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:
	var newEffect: TileEffect = effect.duplicate()
	newEffect.damageDealt = 0
	newEffect.owner = owner
	newEffect.resource_name = str(owner)
	for i in grid.size():
		if grid[i].character:
			grid[i].AddNewEffect(newEffect)
	
	
