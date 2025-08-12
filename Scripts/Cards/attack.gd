class_name Attack

extends Card

func _init():
	name = "attack"
	cost = 1
	value = 100

func play_card(battle):
	super(battle)
	battle.enemy_damage(value)
	
	
