extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:
	var newEffect: TileEffect = effect.duplicate() #Creates a new instance of a damage effect

	newEffect.damageDealt = 999 #How much damage will be dealt
	newEffect.owner = owner #The enemy who created the attack
	newEffect.resource_name = str(owner) #Naming the resources after it's owner
	for i in grid.size():
		grid[i].AddNewEffect(newEffect)
	
