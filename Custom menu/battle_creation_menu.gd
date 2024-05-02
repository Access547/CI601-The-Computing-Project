extends Node2D


@onready var alliesOptions: OptionButton = $"Menu/Allies Options"
@onready var enemyOptions: OptionButton = $"Menu/Enemy Options"
@onready var animPlayer: AnimationPlayer = $Menu/Errors/AnimationPlayer


func _ready() -> void:
	BattleInit.characterArray.clear()
	BattleInit.enemyArray.clear()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Main Menu.tscn")

func AddAlly(classSelected: PackedScene) -> void:
	var label = RichTextLabel.new()
	BattleInit.characterArray.append(classSelected)
	label.text = alliesOptions.get_item_text(alliesOptions.selected)
	label.fit_content = true
	label.theme = load("res://Custom menu/theme.tres")
	$"Menu/Allies Roster/Allies".add_child(label)

func AddEnemy(enemySelected: PackedScene) -> void:
	var label = RichTextLabel.new()
	BattleInit.enemyArray.append(enemySelected)
	label.text = enemyOptions.get_item_text(enemyOptions.selected)
	label.fit_content = true
	label.theme = load("res://Custom menu/theme.tres")
	$"Menu/Enemy Roster/Enemies".add_child(label)

func _on_add_ally_pressed() -> void:
	if BattleInit.characterArray.size() > 3:
		return
	var char: PackedScene
	if alliesOptions.selected == -1:
		return
	elif alliesOptions.selected == 0:
		char = load("res://Player Characters/character.tscn")
	elif alliesOptions.selected == 1:
		char = load("res://Player Characters/Wizard.tscn")
	elif alliesOptions.selected == 2:
		char = load("res://Player Characters/Priest.tscn")
	elif alliesOptions.selected == 3:
		char = load("res://Player Characters/Fencer.tscn")
	
	
	AddAlly(char)


func _on_add_enemy_pressed() -> void:
	if BattleInit.enemyArray.size() > 3:
		return
	var char: PackedScene
	if enemyOptions.selected == -1:
		return
	elif enemyOptions.selected == 0:
		char = load("res://NPCs/Goblin/goblin2.tscn")
	elif enemyOptions.selected == 1:
		char = load("res://NPCs/Archer/archer.tscn")
	elif enemyOptions.selected == 2:
		char = load("res://NPCs/Orc Thrower/Orc Thrower.tscn")
	elif enemyOptions.selected == 3:
		char = load("res://NPCs/Zombie/zombie.tscn")
	elif enemyOptions.selected == 4:
		char = load("res://NPCs/Ghost/Ghost.tscn")

	
	
	AddEnemy(char)


func _on_start_button_pressed() -> void:
	if BattleInit.enemyArray.size() < 1 and BattleInit.characterArray.size() < 4:
		animPlayer.play("ShowEnemyError")
		animPlayer.play("ShowAllyError")
		return
	
	if BattleInit.enemyArray.size() < 1:
		animPlayer.play("ShowEnemyError")
		return
	
	if BattleInit.characterArray.size() < 4:
		animPlayer.play("ShowAllyError")
		return
	get_tree().change_scene_to_file("res://Combat Manager/combat_level.tscn")
