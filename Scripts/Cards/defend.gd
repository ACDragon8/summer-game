class_name Defend

extends Card

var value

func _init():
	name = "defend"
	value = 10

func play_card(battle):
	super(battle)
	battle.player_block(value)
	
