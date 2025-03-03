extends Control

@onready var current_product: ProductRes
@onready var parameters: Array[ParameterRes] = []

@export var products: Array[ProductRes]
@onready var product_popup_instance = preload("res://ui/create_product/create_product.tscn")

func _ready() -> void:
	current_product = products[0]
	current_product.initial_parameters
	parameters.append_array(current_product.initial_parameters)
	
	for product in products:
		%ProductSelector.add_item(product.name)
		
	update_parameters()
	
func _on_panel_toggle_button_pressed() -> void:
	var product_popup := product_popup_instance.instantiate()
	add_child(product_popup)
	product_popup.connect("product_created", _on_product_created)
	
func _on_product_selector_item_selected(index: int) -> void:
	current_product = products[index]
	update_parameters()

func update_parameters() -> void:
	
	# Clear container
	for child in %VBoxContainer.get_children():
		%VBoxContainer.remove_child(child)
		
	for param in current_product.initial_parameters:
		if param is SwitchParameterRes:
			var checkbox = SwitchParamUI.new_switch(param)
			%VBoxContainer.add_child(checkbox)
		elif param is SliderParameterRes:
			var slider = SliderParamUI.new_slider(param)
			%VBoxContainer.add_child(slider)
			
	
	
func _on_product_created(product: ProductRes):
	products.append(product)
	%ProductSelector.add_item(product.name)
