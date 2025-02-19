extends Control

@export var base_products: Array[ProductRes]

signal product_created(product: ProductRes)

func _ready() -> void:
	for product in base_products:
		%BaseProductSelector.add_item(product.name)
	
func _on_cancel_button_pressed() -> void:
	queue_free()


func _on_create_button_pressed() -> void:
	if %ProductNameEdit.text.is_empty():
		return
		
	var product := ProductRes.new()
	var base_product := base_products[%BaseProductSelector.get_selected_id()] 
	
	for param in base_product.initial_parameters:
		product.initial_parameters.append(param.duplicate())
	
	product.name = %ProductNameEdit.text
	
	product_created.emit(product)
	queue_free()
