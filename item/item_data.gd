## This script sets up the information about the items
extends Resource
class_name ItemData

@export var name: String = ""
@export_multiline var description: String = ""
@export var stackable: bool = false
@export var texture: Texture
