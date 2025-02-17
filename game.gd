extends Control

@export var product: ProductResource

@onready var feature_container := %FeatureContainer
@onready var info_container := %InfoContainer
@onready var info_label := %InfoContainer/InfoLabel

@onready var feature_box_instance := preload("res://ui/feature_box/feature_box.tscn")

@onready var feature_box_arr: Array[FeatureBox] = []

var total_cost := 0.0
var total_dmg_cost := 0.0

var money := 300.0

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	for feature in product.features:
		create_feature_box(feature)
	
	update_info_label()
		
func create_feature_box(feature: FeatureResource):
	var feature_box := feature_box_instance.instantiate()
	feature_box.feature_res = feature
	feature_box.feature_updated.connect(_feature_updated)
	feature_container.add_child(feature_box)
	
	feature_box_arr.append(feature_box)

func _feature_updated(feature: FeatureResource, is_active: bool):
	if is_active:
		total_cost += feature.cost
		total_dmg_cost += feature.damage_cost
	else:
		total_cost -= feature.cost
		total_dmg_cost -= feature.damage_cost
	
	update_info_label()
	
func update_info_label():
	var text := "Product:%s\nTotal cost: %d\nTotal damage cost: %d\nMoney: %d" % [product.name, total_cost, total_dmg_cost, money]
	info_label.set_text(text)


func _on_save_button_pressed() -> void:
	money -= total_cost
	
	# FIXME: herhangi bir ozellik eklenmediginde yine de parayi azaltiyor
	for feature_box in feature_box_arr:
		var rand := rng.randf()
		
		# TODO: Daha duzgun bir yontem bul
		if not feature_box.is_active and rand > 0.5:
			money -= feature_box.feature_res.negative_cost
			
		feature_box.uncheck()
		
	update_info_label()
