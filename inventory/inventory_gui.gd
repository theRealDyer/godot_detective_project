# Controls how the inventory acts on the screen
extends Control

var isOpen: bool = false # Check current status of inventory

func Open():
	# Make the inventory visible
	visible = true
	isOpen = true
	
func Close():
	# CLose the inventory
	visible = false
	isOpen = false
