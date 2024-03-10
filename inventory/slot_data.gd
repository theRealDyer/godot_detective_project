## This programs the inventory slot data
## i.e., size of stack and how the inventory slots fill
extends Resource
class_name SlotData

const MAX_STACK_SIZE: int = 99

@export var item_data: ItemData
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1
