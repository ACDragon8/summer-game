extends Node2D

signal new_turn()
signal enemy_dead()

var player_hp
var player_shield
var enemy_hp
var light
var fight
@export var light_display : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	start_fight()

func start_fight():
	player_hp = 100
	player_shield = 0
	enemy_hp = 100
	light = 2
	light_display.text = "Light: " + str(light)
	$CardHand.draw_cards()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Player/PlayerHP.text = "Health: %s" % player_hp
	$Player/PlayerShield.text = "Shield: %s" % player_shield
	$Enemy/EnemyHP.text = "Health: %s" % enemy_hp


func on_card_play_card(battle_card):
	#placeholder until we can figure out how to play different cards
	if battle_card.card.is_playable(self):
		battle_card.card.play_card(self)
		battle_card.hide()
		light_display.text = "Light: " + str(light)
	else:
		print("Unable to play card " +  battle_card.card.name)


func _on_enemy_enemy_attack() -> void:
	#placeholder until we get different enemy attacks
	player_damage(10)


func enemy_damage(amt):
	enemy_hp -= amt
	if enemy_hp <= 0:
		enemy_dead.emit()

func player_damage(amt):
	player_shield -= amt
	if(player_shield < 0):
		player_hp += player_shield
		player_shield = 0

func player_block(amt):
	player_shield += amt
	

#This is to reset the light
func _on_player_end_turn() -> void:
	light = 2
	light_display.text = "Light: " + str(light)
