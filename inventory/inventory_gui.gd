# Controls how the inventory acts on the screen
extends Control

var isOpen: bool = false # Check current status of inventory

@onready var inventory: InventoryData = preload("res://inventory/inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.slot_datas.size(), slots.size())):
		slots[i].update(inventory.slot_datas[i].item_data)

func Open():
	# Make the inventory visible
	visible = true
	isOpen = true
	update()
	
func Close():
	# CLose the inventory
	visible = false
	isOpen = false
