extends Node2D

signal new_turn()

var player_hp
var player_shield
var enemy_hp
var light

# Called when the node enters the scene tree for the first time.
func _ready():
	player_hp = 100
	player_shield = 0
	enemy_hp = 100
	light = 0
	$CardHand.draw_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Player/PlayerHP.text = "Health: %s" % player_hp
	$Player/PlayerShield.text = "Shield: %s" % player_shield
	$Enemy/EnemyHP.text = "Health: %s" % enemy_hp


func on_card_play_card(card):
	#placeholder until we can figure out how to play different cards
	card.play_card(self)


func _on_enemy_enemy_attack() -> void:
	#placeholder until we get different enemy attacks
	player_damage(10)


func enemy_damage(amt):
	enemy_hp -= amt

func player_damage(amt):
	player_shield -= amt
	if(player_shield < 0):
		player_hp += player_shield
		player_shield = 0

func player_block(amt):
	player_shield += amt
	
