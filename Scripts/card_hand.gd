extends Node

@export var card_scene : PackedScene
@export var hand_size = 2
@export var hand_pos_y = 600
@export var hand_center_x = 700
@export var card_spacing = 80
#signal which_card_played(card)
var current_hand

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
		add_child(card_drawn)
		add_child(card_marker)
		card_drawn.connect("play_card", battle.on_card_play_card)
		spacer += 1
	
