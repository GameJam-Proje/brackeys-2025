class_name SliderParamUI
extends HBoxContainer

@export var parameter: SliderParameterRes

const SCENE: PackedScene = preload("res://ui/parameters/slider/slider_param_ui.tscn")

@onready var slider := $Slider
@onready var label := $Label

func _ready() -> void:
	label.set_text(parameter.label)
	slider.max_value = parameter.max_value
	slider.min_value = parameter.min_value
	slider.value =  parameter.value
	slider.step = parameter.step
	
static func new_slider(param: SliderParameterRes) -> SliderParamUI:
	var obj = SCENE.instantiate()
	obj.parameter = param

	return obj

func _on_slider_value_changed(value: float) -> void:
	parameter.value = value
