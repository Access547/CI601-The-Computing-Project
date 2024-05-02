extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:

	for i in grid.size():
		if grid[i].character != null:
			var newEffect: TileEffect = effect.duplicate() #Creates a new instance of a damage effect
			newEffect.damageDealt = grid[i].character.health #How much damage will be dealt
			newEffect.owner = owner #The enemy who created the attack
			newEffect.resource_name = str(owner) #Naming the resources after it's owner
			grid[i].AddNewEffect(newEffect)


