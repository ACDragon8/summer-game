class_name Defend

extends Card

func _init():
	name = "defend"
	cost = 1
	value = 10

func play_card(battle):
	super(battle)
	battle.player_block(value)
	
