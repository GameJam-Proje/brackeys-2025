extends Node

# FIXME: çalışmıyor :((
func add_report(title: String, date: String, text: String, image: Texture2D):
	var report_scene = ResourceLoader.load("res://news_menu/news_report.tscn")
	var report_node = report_scene.instantiate()
	report_node.set_fields(title, date, text, image)
	$Panel/VBoxContainer/ScrollContainer/VBoxContainer.add_child(report_node)
