class_name SwitchParamUI
extends CheckButton

@export var parameter: SwitchParameterRes

const SCENE: PackedScene = preload("res://ui/parameters/switch/switch_param_ui.tscn")

func _on_toggled(toggled_on: bool) -> void:
	parameter.value = toggled_on
	
static func new_switch(param: SwitchParameterRes) -> SwitchParamUI:
	var obj = SCENE.instantiate()
	obj.parameter = param
	obj.set_text(param.label)
	obj.button_pressed = param.value
	return obj
	
