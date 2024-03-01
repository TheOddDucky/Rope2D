class_name Rope2D
extends Node2D

@export var length : int = 1
@export var color : Color = Color.WHITE
@export var thickness : int = 2

var segment = preload("res://addons/Rope2D/segment.tscn")

var rope_line_2d = preload("res://addons/Rope2D/rope_line_2d.tscn")

func _ready():
	var seg = segment.instantiate()
	seg.position = self.position
	for i in length:
		seg.position.y = self.position.y + i * 10
		self.add_child(seg.duplicate())
	var i = 0
	var ii = 0
	for child in get_children():
		child.get_node("PinJoint2D").node_b = get_child(i+1).get_path()
		if !i==length-2:
			i+= 1
	var rope_line = rope_line_2d.instantiate()
	rope_line.position = self.position
	rope_line.default_color = color
	rope_line.width = thickness
	self.add_child(rope_line)
	for l in length:
		rope_line.add_point(get_child(l - 1).position)
	print("Spawned")

func _process(delta):
	var rope_line = get_node("RopeLine2d")
	var i = 0
	for point in rope_line.points:
		rope_line.set_point_position(i,get_child(i).position)
		i+=1
