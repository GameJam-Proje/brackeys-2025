extends Node


@export var initial_value: NewsRes
@onready var texture_rect = $HBoxContainer/TextureRect
@onready var rich_text_label = $HBoxContainer/RichTextLabel
const format = "[b][color=#f55]%s[/color][/b] [i][color=#bbb](%s/%s/%s)[/color][/i]\n%s"

func _ready() -> void:
	set_fields(initial_value)

func set_fields(v: NewsRes) -> void:
	texture_rect.texture = v.image
	rich_text_label.text = format % [v.title, v.day, v.month, v.year, v.body]
