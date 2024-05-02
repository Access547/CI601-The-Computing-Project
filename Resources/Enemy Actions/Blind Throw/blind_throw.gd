extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:

	for i in 1:
		var pos = randi_range(0,7)
		var newEffect: TileEffect = effect.duplicate() #Creates a new instance of a damage effect
		newEffect.damageDealt = 20 #How much damage will be dealt
		newEffect.owner = owner #The enemy who created the attack
		newEffect.resource_name = str(owner) #Naming the resources after it's owner
		grid[pos].AddNewEffect(newEffect)


