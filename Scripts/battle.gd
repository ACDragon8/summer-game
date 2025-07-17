extends Node2D

var player_hp
var enemy_hp
var light

# Called when the node enters the scene tree for the first time.
func _ready():
	player_hp = 100
	enemy_hp = 100
	light = 0
	$CardHand.draw_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Player/PlayerHP.text = "Health: %s" % player_hp
	$Enemy/EnemyHP.text = "Health: %s" % enemy_hp


func on_card_play_card(card):
	#placeholder until we can figure out how to play different cards
	enemy_hp -= 10


func _on_enemy_enemy_attack() -> void:
	#placeholder until we get different enemy attacks
	player_hp -= 10
