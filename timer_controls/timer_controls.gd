extends Node

@onready var x0_button = $ZeroXButton
@onready var x1_button = $OneXButton
@onready var x2_button = $TwoXButton
@onready var x4_button = $FourXButton
@onready var x8_button = $EightXButton
@onready var label = $Label

func on_date_updated(unix_time: int):
	label.text = Time.get_datetime_string_from_unix_time(unix_time, true)

func change_timescale_multiplier(multiplier: float):
	GlobalTimer.scale_multiplier = multiplier

func _ready() -> void:
	GlobalTimer.connect("date_updated", on_date_updated)
	x0_button.connect("pressed", func(): change_timescale_multiplier(0))
	x1_button.connect("pressed", func(): change_timescale_multiplier(1))
	x2_button.connect("pressed", func(): change_timescale_multiplier(2))
	x4_button.connect("pressed", func(): change_timescale_multiplier(4))
	x8_button.connect("pressed", func(): change_timescale_multiplier(8))
