extends Node

@export var card_scene : PackedScene
@export var hand_size = 4
@export var hand_pos_y = 600
@export var hand_center_x = 700
@export var card_spacing = 80
#signal which_card_played(card)
var current_hand = []
var deck : Array
var discard = []

func _ready():
	deck = [Attack.new(),Attack.new(),Attack.new(), Defend.new(),Defend.new(),ChargeAndCover.new()]
	deck.shuffle()


func draw_cards() -> void:
	#This for now will just place cards at the bottom, maybe later do a drawing animation/tween
	var spacer = floor(hand_size/2) * -1
	var battle = get_parent()
	for i in range(0, hand_size):
		var card_drawn = card_scene.instantiate()
		var card_marker = Marker2D.new()
		
		card_drawn.position = Vector2(hand_center_x + card_spacing * spacer , hand_pos_y)
		card_marker.position = Vector2(hand_center_x + card_spacing * spacer , hand_pos_y)
		card_drawn.return_position = card_marker
		
		draw_card(card_drawn)
		
		add_child(card_drawn)
		add_child(card_marker)
		card_drawn.connect("play_card", battle.on_card_play_card)
		spacer += 1
		current_hand.push_back(card_drawn)

func draw_card(battle_card):
	var c : Card = deck.pop_front()
	battle_card.load_card(c)
	#TODO: Make is that this happens when a card is played rather than here
	deck.push_back(c)
	battle_card.show()




func _on_end_turn_button_end_player_turn():
	for c in current_hand:
		if(!c.visible):
			draw_card(c)
