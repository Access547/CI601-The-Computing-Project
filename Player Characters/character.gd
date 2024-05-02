extends Node2D
class_name Character


signal defeated(emitter)
signal GotSelected
signal FinishedAttacking(emitter)
signal Damaged(amount)

@export var gridPos: int
@export var charName: String
@export var maxHealth: int
@export var damage: int
@export var speed: int
@export var buffDamage: int


@export var isPinned: bool = false

var actions: Array[Action]
var playerClass: String = "Knight"
var lastAction: Action
@onready var damageNumber: PackedScene = preload("res://GUI/damage_number.tscn")
@onready var animPlayer: AnimationPlayer = $Character/AnimationPlayer
@onready var slash: Action = load("res://Resources/Player Actions/Slash/slash_action.tres") as Action
@onready var massTeleport: Action = load("res://Resources/Player Actions/Mass Teleport/mass_teleport.tres") as Action
@onready var reinforce = load("res://Resources/Player Actions/Reinforce/reinforce.tres") as Action
@onready var finalCut = load("res://Resources/Player Actions/Final Cut/final_cut.tres") as Action
@onready var exploitWeakness = load("res://Resources/Player Actions/Exploit Weakness/exploit_weakness.tres") as Action
@onready var fireBall = load("res://Resources/Player Actions/Fireball/fireball.tres") as Action
@onready var fleche = load("res://Resources/Player Actions/Fleche/fleche.tres") as Action
@onready var heal = load("res://Resources/Player Actions/Heal/heal.tres") as Action
@onready var purgeUndead = load("res://Resources/Player Actions/Purge Undead/purge_undead.tres") as Action
@onready var riposte = load("res://Resources/Player Actions/Riposte/riposte.tres") as Action
@onready var sprite: Sprite2D = $Character

var amountTaken

var health: int:
	set(value):
		amountTaken = value - health
		health = clamp(value, 0, maxHealth)
		Damaged.emit(amountTaken)
		if health <= 0:
			defeated.emit(self)



var selected: bool = false:
	set(value):
		if !selected:
			if value:
				GotSelected.emit()
		selected = value
		
		var pointer = get_node_or_null("Pointer")
		if pointer:
			pointer.visible = value


func _ready() -> void:
	Damaged.connect(MakeDamageNumber)
	health = maxHealth
	#modulate = Color(randf_range(0,1),randf_range(0,1),randf_range(0,1))
	actions.append(slash)
	actions.append(reinforce)
	actions.append(finalCut)


func MakeDamageNumber(number: int):
	var dwa: RichTextLabel = damageNumber.instantiate()
	add_child(dwa)
	dwa.text = str("[center][wave]", number)



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Death":
		queue_free()
