extends Node

@export var initial_title: String
@export var initial_date: String
@export var initial_text: String
@export var initial_image: Texture2D

@onready var texture_rect = $HBoxContainer/TextureRect
@onready var rich_text_label = $HBoxContainer/RichTextLabel

func _ready() -> void:
	set_fields(initial_title, initial_date, initial_text, initial_image)

func set_fields(title: String, date: String, text: String, image: CompressedTexture2D):
	texture_rect.texture = image
	rich_text_label.text = "[b][color=#f55]%s[/color][/b] [i][color=#bbb](%s)[/color][/i]\n%s" \
						   % [title, date, text]
	pass
