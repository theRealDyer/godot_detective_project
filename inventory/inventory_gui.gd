# Controls how the inventory acts on the screen
extends Control

@onready var playerNode = $"../../Player"
@onready var inventory: InventoryData = preload("res://inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var isOpen: bool = false # Check current status of inventory

func _ready():
	inventory.updated.connect(update)
	update()

func update():	
	for i in range(min(inventory.slot_datas.size(), slots.size())):
		slots[i].update(inventory.slot_datas[i].item_data)

func Open() -> bool:
	# Make the inventory visible
	visible = true
	isOpen = true
	update()
	
	# Pause player movement
	playerNode.get_tree().paused=true
	
	return isOpen
	
func Close() -> bool:
	# CLose the inventory
	visible = false
	isOpen = false
		
	# Unpause player movement
	playerNode.get_tree().paused=false
	return isOpen
