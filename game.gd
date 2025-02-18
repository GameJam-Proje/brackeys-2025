extends Control

@onready var current_product: ProductRes
@onready var parameters: Array[ParameterRes] = []

@export var products: Array[ProductRes]
@onready var product_popup_instance = preload("res://ui/create_product/create_product.tscn")

func _ready() -> void:
	current_product = products[0]
	
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
			var checkbox = CheckBox.new()
			checkbox.set_text(param.label)
			checkbox.button_pressed = param.value
			
			%VBoxContainer.add_child(checkbox)
	
func _on_product_created(product: ProductRes):
	products.append(product)
	%ProductSelector.add_item(product.name)
