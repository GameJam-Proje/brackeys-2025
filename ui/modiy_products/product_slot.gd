class_name ProductSlot
extends VBoxContainer

@export var product_name : String
@export var id := 0

signal product_deleted(id: int)
signal product_selected(id: int)

const SCENE := preload("res://ui/modiy_products/product_slot.tscn")
func _ready() -> void:
	%Label.set_text("[center][wave][color=yellow]%s[/color][/wave][/center]" % product_name)
	
	
static func new_slot(name: String, id: int) -> ProductSlot:
	var slot = SCENE.instantiate()
	
	slot.product_name = name
	slot.id = id
	
	return slot
	

func _on_edit_button_pressed() -> void:
	product_selected.emit(id)
	queue_free()


func _on_delete_button_pressed() -> void:
	product_deleted.emit(id)
