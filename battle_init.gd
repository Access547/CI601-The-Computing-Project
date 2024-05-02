extends Node

var default: PackedScene = load("res://Player Characters/character.tscn")
var wizardScene: PackedScene = load("res://Player Characters/Wizard.tscn")
var fencerScene: PackedScene = load("res://Player Characters/Fencer.tscn")
var priestScene: PackedScene = load("res://Player Characters/Priest.tscn")
var characterArray: Array[PackedScene] = [default, wizardScene, fencerScene, priestScene]
var enemyArray: Array[PackedScene]
var savedPlayerPos: Vector2
