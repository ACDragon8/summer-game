class_name Attack

extends Card

func _init():
	name = "attack"
	cost = 1
	value = 10

func play_card(battle):
	super(battle)
	battle.enemy_damage(value)
	
