extends Control

@export var product: ProductRes
@onready var parameters: Array[ParameterRes] = []

@onready var product_popup = preload("res://ui/create_product/create_product.tscn")

func _ready() -> void:
	parameters.append_array(product.initial_parameters)
	
	for param in parameters:
		if param is SwitchParameterRes:
			var checkbox = CheckBox.new()
			checkbox.set_text(param.label)
			checkbox.button_pressed = param.value
			
			%VBoxContainer.add_child(checkbox)
	
func _on_panel_toggle_button_pressed() -> void:
	add_child(product_popup.instantiate())
