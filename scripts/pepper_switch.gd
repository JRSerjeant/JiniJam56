extends Node

var dropper

func _ready():
	dropper = get_node("/root/game/dropper")

func _pressed():
	var currenttexture = dropper.get_node("Sprite").texture
	if(currenttexture != self.icon):
		dropper.get_node("Sprite").texture = self.icon
