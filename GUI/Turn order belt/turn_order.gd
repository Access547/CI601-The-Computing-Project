extends Control


@export var combatManager: CombatManager


var turnOrder: Array[Character]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	turnOrder.append_array(combatManager.turnOrder)
	for i in combatManager.turnOrder.size():
		AddNewTurn(combatManager.turnOrder[i])
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func AddNewTurn(character: Character):
	var newTurn = preload("res://GUI/Turn order belt/turn_order_icon.tscn").instantiate()
	$HBoxContainer.add_child(newTurn)
	newTurn.character = character.texture
	newTurn.rect.modulate = character.modulate
