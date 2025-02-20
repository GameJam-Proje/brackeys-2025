extends Control

signal product_selected(index: int)

@export var products: Array[ProductRes]

func _ready() -> void:
	for i in range(len(products)):
		var product := products[i]
		var slot := ProductSlot.new_slot(product.name, i)
		slot.product_deleted.connect(_on_product_deleted)
		slot.product_selected.connect(_on_product_selected)

		%Container.add_child(slot)
			

func _on_close_button_pressed() -> void:
	queue_free()
	
func _on_product_deleted(id: int):
	print("deleted id: %d" % id)
	
func _on_product_selected(id: int):
	print("selected id %d" % id)
	queue_free()
	
