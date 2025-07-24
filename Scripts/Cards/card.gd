class_name Card

var name : String
var cost : int
var value : int

func _init():
	name = "Card"
	cost = 0

func play_card(battle):
	print("card: " +name)
