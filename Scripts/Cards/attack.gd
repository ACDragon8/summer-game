class_name Attack

extends Card

var value

func _init():
	name = "attack"
	value = 10

func play_card(battle):
	super(battle)
	battle.enemy_damage(value)
	
