extends EnemyAction




func Activate(grid: Array[GridInfo], owner: Enemy) -> void:
	var newEffect: TileEffect = effect.duplicate() #Creates a new instance of a damage effect
	var options: Array[int] = [0,2,4,6] #Columns that can be targetted
	var picked: int = options.pick_random() #Choses a column to target
	newEffect.damageDealt = 6 #How much damage will be dealt
	newEffect.owner = owner #The enemy who created the attack
	newEffect.resource_name = str(owner) #Naming the resources after it's owner
	grid[picked].AddNewEffect(newEffect) #Calls the method that adds the effect to a tile
	grid[picked + 1].AddNewEffect(newEffect) #Adds the effect to the tile in front as well
