extends Node

@onready var news_container = $Panel/VBoxContainer/ScrollContainer/VBoxContainer
@onready var news_card_scene = preload("res://news_menu/news_card.tscn")
@export var initial_news_res: NewsRes

# TODO: Test amaçlı, silinecek!
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		initial_news_res.year += 1
		add_card(initial_news_res)

func add_card(news_res: NewsRes):
	var news_card = news_card_scene.instantiate()
	news_card.initial_value = news_res
	news_container.add_child(news_card)
	news_container.move_child(news_card, 0)
