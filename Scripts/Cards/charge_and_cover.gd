class_name ChargeAndCover

extends Card

func _init():
	name = "charge_and_cover"
	cost = 2
	value = 10

func play_card(battle):
	super(battle)
	battle.enemy_damage(value)
	battle.player_block(value)
	
func is_playable(battle):
	if !super(battle):
		return false
	else:
		print("Checking extra conditions...")
		return true
