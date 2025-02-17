class_name FeatureBox
extends Control

signal feature_updated(feature_res: FeatureResource, is_active: bool)
@export var feature_res: FeatureResource

var is_active: bool = false

func _ready() -> void:
	%CheckBox.set_text(feature_res.text)
	
	var text := "Cost: %d\nDamage Cost: %d" % [feature_res.cost, feature_res.damage_cost]
	%InfoLabel.set_text(text)
	
func _on_check_box_toggled(toggled_on: bool) -> void:
	is_active = !is_active
	feature_updated.emit(feature_res, toggled_on)


func uncheck() -> void:
	%CheckBox.button_pressed = false
