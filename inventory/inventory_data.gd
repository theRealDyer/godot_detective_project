## This script controls the inventory data as a whole
extends Resource
class_name InventoryData
signal updated

@export var slot_datas: Array[SlotData]
  
func insert(item: SlotData):
	for i in range(slot_datas.size()):
		if !slot_datas[i].item_data:
			slot_datas[i]=item
			break
			
	updated.emit()
