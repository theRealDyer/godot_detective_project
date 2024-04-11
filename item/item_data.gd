## This script sets up the information about the items
extends Resource
class_name ItemData

@export var name: String = ""
@export_multiline var description: String = ""
@export var stackable: bool = false
# Use Texture for individual images for each item
# Easier to use AtlasTexture if multiple item textures in one image
@export var texture: Texture
