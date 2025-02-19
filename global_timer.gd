extends Node


var curr_unix_time: int = Time.get_unix_time_from_datetime_string("2025-02-19")
var curr_datetime_dict: Dictionary = Time.get_datetime_dict_from_unix_time(curr_unix_time)
var curr_elapsed_secs: float = 0
const time_scale: float = 3600 * 3
const date_update_freq_secs: float = 60
var scale_multiplier: float = 1

signal date_updated(unix_time: int)

func set_date(datetime: String) -> void:
	curr_unix_time = Time.get_unix_time_from_datetime_string(datetime)
	curr_datetime_dict = Time.get_datetime_dict_from_unix_time(curr_unix_time)
	date_updated.emit(curr_unix_time)

func _ready() -> void:
	date_updated.emit(curr_unix_time)

func _physics_process(delta: float) -> void:
	curr_elapsed_secs += delta * time_scale * scale_multiplier
	if curr_elapsed_secs >= date_update_freq_secs:
		curr_unix_time += floori(curr_elapsed_secs)
		curr_datetime_dict = Time.get_datetime_dict_from_unix_time(curr_unix_time)
		curr_elapsed_secs = 0
		date_updated.emit(curr_unix_time)
