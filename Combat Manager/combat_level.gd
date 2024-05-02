extends Node2D
class_name CombatManager


var gridResource = preload("res://Resources/Grid Info/Grid_info.gd")


var turn: int = 1
var turnOrderBase: Array[Character]
var selectingSpace: bool = false:
	set(value):
		selectingSpace = value
		SelectSpaceMode()

var selectedSpace: int
var moving: bool = false
var selectingEnemies: bool = false:
	set(value):
		selectingEnemies = value
		SelectEnemiesMode()

var selectedEnemySpace: int
var selectingMenuItem: bool = false
var enemies: Array[Character]
var actionSelected: int
var characters: Array[Character]

var turnOrder: Array[Character] #This needs to be populated automatically using some sort of speed stat!

@export var floaters: Array[RichTextLabel]


@onready var sfx: AudioStreamPlayer = $sfx
@onready var menu: Menu = $Menus/Menu
@onready var tileMap: TileMap = $TileMap
const healthBars = preload("res://GUI/health_bars/health_bars.tscn")



#  ╔═══╦═══╗
#  ║ 0 ║ 1 ║Changing value by 1 is left and right
#  ╠═══╬═══╣Changing value by 2 is up and down
#  ║ 2 ║ 3 ║
#  ╠═══╬═══╣
#  ║ 4 ║ 5 ║
#  ╠═══╬═══╣
#  ║ 6 ║ 7 ║
#  ╚═══╩═══╝

var grid: Array[GridInfo] = [GridInfo.new(), GridInfo.new(), GridInfo.new(), GridInfo.new(), 
GridInfo.new(), GridInfo.new(), GridInfo.new(), GridInfo.new()]



func _ready() -> void:
	
	for i in BattleInit.characterArray.size():
		var char = BattleInit.characterArray[i].instantiate()
		char.maxHealth = 20
		char.gridPos = i
		grid[i].character = char
		add_child(char)
		characters.append(char)
		print(characters)
		
	for i in BattleInit.enemyArray.size():
		var char = BattleInit.enemyArray[i].instantiate()
		char.maxHealth = 20
		add_child(char)
		enemies.append(char)
		
	var dwa = $"Menus/health bars".get_children()
	for i in dwa.size():
		dwa[i].loadChars()
	
	
	
	tileMap.get_cell_tile_data(1, Vector2i(3,0)).modulate.a = 1
	
	var combatants: = get_tree().get_nodes_in_group("Combatant")
	for i in combatants.size():
		combatants[i].defeated.connect(CombatantDefeated)
	for i in enemies.size():
		enemies[i].FinishedAttacking.connect(DoEnemyTurn)
	


	turnOrder.append_array(characters)
	turnOrderBase.append_array(turnOrder)

		
	ConstructGrid()


func UpdateAllFloaters() -> void:
	for i in floaters.size():
		floaters[i].Update()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Main Menu.tscn")
	
	if Input.is_action_just_pressed("Q"):
		selectingEnemies = false
		selectingMenuItem = false
		selectingSpace = false
		menu.DeleteInfoLabel()
		menu.DeleteLabels()
		tileMap.SetSelectedTile(100)
		tileMap.SetSelectedEnemyTile(100)
	if !selectingMenuItem:
		if !selectingSpace:
			if Input.is_action_just_pressed("2") and !selectingEnemies and !turnOrder.front().isPinned:
				moving = true
				selectingSpace = true
			if Input.is_action_just_pressed("1") and !selectingEnemies:
				selectingMenuItem = true
				for i in turnOrder.front().actions.size():
					menu.makeNewLabel(turnOrder.front().actions[i].name)
		if selectingSpace:
			if Input.is_action_just_pressed("Space"):
				if moving:
					if grid[selectedSpace].character == null:
						MoveCharacterGrid(turnOrder.front(), selectedSpace)
						ResolveTurn()
					
			if Input.is_action_just_pressed("Down"):
				selectedSpace += 2
				
				if selectedSpace > 7:
					selectedSpace -= 2
					selectedSpace -= 6
				tileMap.SetSelectedTile(selectedSpace)
				
			if Input.is_action_just_pressed("Up"):
					selectedSpace -= 2
					
					if selectedSpace < 0:
						selectedSpace += 2
						selectedSpace += 6
					tileMap.SetSelectedTile(selectedSpace)
					
			if Input.is_action_just_pressed("Left"):
				selectedSpace -= 1
				
				if selectedSpace < 0:
					selectedSpace += 1
					selectedSpace += 7
				tileMap.SetSelectedTile(selectedSpace)
			if Input.is_action_just_pressed("Right"):
					selectedSpace += 1

					if selectedSpace > 7:
						selectedSpace -= 1
						selectedSpace -= 7
					tileMap.SetSelectedTile(selectedSpace)
		
		
		if selectingEnemies:
			if Input.is_action_just_pressed("1"):
				selectedEnemySpace = 0
				if get_node_or_null(str("E", selectedEnemySpace)):
					turnOrder[0].actions[actionSelected].Activate(get_node(str("E", selectedEnemySpace)), grid, self)
					turnOrder[0].animPlayer.play(turnOrder[0].actions[actionSelected].animType)
					turnOrder[0].animPlayer.queue("idle")
					selectingEnemies = false
					ResolveTurn()
			if Input.is_action_just_pressed("2"):
				selectedEnemySpace = 1
				if get_node_or_null(str("E", selectedEnemySpace)):
					turnOrder[0].actions[actionSelected].Activate(get_node(str("E", selectedEnemySpace)), grid, self)
					turnOrder[0].animPlayer.play(turnOrder[0].actions[actionSelected].animType)
					turnOrder[0].animPlayer.queue("idle")
					selectingEnemies = false
					ResolveTurn()
			if Input.is_action_just_pressed("3"):
				selectedEnemySpace = 2
				if get_node_or_null(str("E", selectedEnemySpace)):
					turnOrder[0].actions[actionSelected].Activate(get_node(str("E", selectedEnemySpace)), grid, self)
					turnOrder[0].animPlayer.play(turnOrder[0].actions[actionSelected].animType)
					turnOrder[0].animPlayer.queue("idle")
					selectingEnemies = false
					ResolveTurn()
			if Input.is_action_just_pressed("4"):
				selectedEnemySpace = 3
				if get_node_or_null(str("E", selectedEnemySpace)):
					turnOrder[0].actions[actionSelected].Activate(get_node(str("E", selectedEnemySpace)), grid, self)
					turnOrder[0].animPlayer.play(turnOrder[0].actions[actionSelected].animType)
					turnOrder[0].animPlayer.queue("idle")
					selectingEnemies = false
					ResolveTurn()
			if Input.is_action_just_pressed("Space"):
				if get_node_or_null(str("E", selectedEnemySpace)):
					turnOrder[0].actions[actionSelected].Activate(get_node(str("E", selectedEnemySpace)), grid, self)
					turnOrder[0].animPlayer.play(turnOrder[0].actions[actionSelected].animType)
					turnOrder[0].animPlayer.queue("idle")
					selectingEnemies = false
					ResolveTurn()

			if Input.is_action_just_pressed("Left"):
				selectedEnemySpace -= 1

				if selectedEnemySpace < 0:
					selectedEnemySpace += 4
				tileMap.SetSelectedEnemyTile(selectedEnemySpace)

			if Input.is_action_just_pressed("Right"):
				selectedEnemySpace += 1
				if selectedEnemySpace > 3:
					selectedEnemySpace -= 4
				tileMap.SetSelectedEnemyTile(selectedEnemySpace)
					
	else:
		if Input.is_action_just_pressed("1"):
			actionSelected = 0
			turnOrder[0].actions[0].SetUp(self)
		elif Input.is_action_just_pressed("2"):
			actionSelected = 1
			turnOrder[0].actions[1].SetUp(self)
		elif Input.is_action_just_pressed("3"):
			actionSelected = 2
			turnOrder[0].actions[2].SetUp(self)
			


func SelectSpaceMode() -> void:
	if selectingSpace == true:
		selectedSpace = 0
		tileMap.SetSelectedTile(selectedSpace)

func SelectEnemiesMode() -> void:
	if selectingEnemies == true:
		selectedEnemySpace = 0
		tileMap.SetSelectedEnemyTile(selectedEnemySpace)


#Moves the character both physically and on the grid
func MoveCharacterGrid(character: Character, newSpace: int) -> void:
	grid[character.gridPos].character = null
	character.gridPos = newSpace
	grid[newSpace].character = character
	MoveCharacter(character)
	selectingSpace = false
	
	



#Function used to construct the grid at combat start.
func ConstructGrid() -> void:
	#Loops through all characters to place them
	for i in characters.size():
		#Update grid to contain character. This already lookin a bit messy
		grid[characters[i].gridPos].character = characters[i]

		MoveCharacter(characters[i]) #Moves current character
		turnOrder.front().selected = true
	
	for i in enemies.size():
		enemies[i].position = get_node("enemy"+str(i)).position
		enemies[i].gridPos = i
		enemies[i].name = str("E", enemies[i].gridPos)
		enemies[i].enemyActions[enemies[i].nextAction].Activate(grid, enemies[i])
		
	for i in grid.size():
		if grid[i].tileEffect.size() > 0:
			tileMap.SetTileEffect(i)
			
	UpdateAllFloaters()


#Moves the character physically in space
func MoveCharacter(character: Character) -> void:
	character.position = get_node(str(character.gridPos)).position



func ActivateGridEffect(tile: GridInfo) -> void:
	tile.character.health -= tile.damageEffect.front().damageAmount
	tile.damageEffect.pop_front()




#Passes the turn on a character and onto the next character
func ResolveTurn() -> void:
	selectingMenuItem = false
	if turnOrder.size() > 0:
		turnOrder.pop_front().selected = false
	menu.DeleteLabels()
	tileMap.SetSelectedEnemyTile(100)
	tileMap.SetSelectedTile(100)
	if turnOrder.size() == 0:
		DoEnemyTurn()
		turnOrder.append_array(turnOrderBase)
	#Update Damage Floater
	UpdateAllFloaters()
	
	if turnOrder.front():
		turnOrder.front().selected = true
	
	print(enemies)





func CombatantDefeated(emitter: Character) -> void:
	if emitter is Enemy:
		var newArray = []
		turnOrder.erase(emitter)
		turnOrderBase.erase(emitter)
		enemies.erase(emitter)
		for i in grid.size():
			for j in grid[i].tileEffect.size():
				if grid[i].tileEffect[j].owner != emitter:
					newArray.append(grid[i].tileEffect[j])
			grid[i].tileEffect.clear()
			grid[i].tileEffect.append_array(newArray)
			newArray.clear()

			if grid[i].tileEffect.size() <= 0:
				tileMap.RemoveTileEffect(i, 2)
		emitter.animPlayer.play("Death")
		
		#Update Damage Floater
		UpdateAllFloaters()
		
		CheckWinCon()
	else:
		#Remove them from turn order
		turnOrder.erase(emitter)
		turnOrderBase.erase(emitter)
		
		#Remove them from the grid
		for i in grid.size():
			if grid[i].character == emitter:
				grid[i].character = null
		#Check if we've lost
		CheckWinCon()
		
		#Show death animation
		emitter.animPlayer.play("Death")
	
func CheckWinCon() -> void:
	if enemies.size() <= 0:
		if DemoLoader.isInDemo:
			get_tree().change_scene_to_file("res://Demo stuff/demo_level.tscn")
		else:
			get_tree().change_scene_to_file("res://Custom menu/battle_creation_menu.tscn")

	if turnOrderBase.size() <= 0:
		if DemoLoader.isInDemo:
			get_tree().change_scene_to_file("res://Demo stuff/demo_level.tscn")
		else:
			get_tree().quit(0)

func DoEnemyTurn() -> void:
	
	#Applies damage to friendly characters and removes all tileEffects from grid and tilemap
	for i in grid.size():
		
		#Apply Damage to friendly
		if grid[i].character:
			grid[i].character.health -= grid[i].CalcTotalDamage()
			
			#Check for activate method
			for j in grid[i].tileEffect.size():
				if grid[i].tileEffect[j].has_method("Activate"):
					grid[i].tileEffect[j].Activate(grid[i].character)
		
		#Remove all tileEffects from all grid spaces 
		grid[i].tileEffect.clear()
		#Remove all tileEffects from tilemap
		tileMap.RemoveTileEffect(i, 2)
		
	#Add new attacks to grid
	for i in enemies.size():
		enemies[i].SetNextAttack()
		enemies[i].enemyActions[enemies[i].nextAction].Activate(grid, enemies[i])
		
	#Add new attacks to tilemap
	
	for i in grid.size():
		if grid[i].tileEffect.size() > 0:
			tileMap.SetTileEffect(i)

	#Tick turn over
	TurnOrder.turn += 1
