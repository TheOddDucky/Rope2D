@tool
extends EditorPlugin

func _enter_tree():
	# Initialization of the plugin goes here
	add_custom_type("Rope2D", "PhysicsBody2D", preload("res://addons/Rope2D/rope_2d.gd"), preload("icon.svg"))

func _exit_tree():
	# Clean-up of the plugin goes here
	remove_custom_type("Rope2D")
