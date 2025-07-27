class_name Card

var name : String
var cost : int
var value : int

func _init():
	name = "Card"
	cost = 0

func play_card(battle):
	print("card: " +name)
	battle.light = battle.light - cost

func is_playable(battle) -> bool:
	if battle.light >= cost:
		return true
	print("Not enough light to play")
	return false
