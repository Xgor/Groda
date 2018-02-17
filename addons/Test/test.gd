tool
extends Node2D

var pixelsPerSpring = 4

var _width = 1024 setget _private, _private
func _private(value = null):
	print("Invalid access to private variable!")
	return value

var width setget set_width, get_width

var springs


func _ready():
	
	_refresh_child()
	pass


func _get_property_list():
	return [
		{usage = PROPERTY_USAGE_CATEGORY, type = TYPE_NIL, name = "Water2D"},
		{type = TYPE_INT, name = "width"},
		{type = TYPE_INT, name = "pixelsPerSpring"}
		
	]

func get_width():
	return _width
	pass

func set_width(w):
	_width = w
	_refresh_child()
	pass

func _process(delta):
	var left_deltas
	var right_deltas
	
#	for (int j = 0; j < 8; j++)
#			{
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#					{
#						lDeltas[i] = Spread * (columns[i].Height - columns[i - 1].Height);
#						columns[i - 1].Speed += lDeltas[i];
#					}
#					if (i < columns.Length - 1)
#					{
#						rDeltas[i] = Spread * (columns[i].Height - columns[i + 1].Height);
#						columns[i + 1].Speed += rDeltas[i];
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
#					}
#				}
#
#				for (int i = 0; i < columns.Length; i++)
#				{
#					if (i > 0)
#						columns[i - 1].Height += lDeltas[i];
#					if (i < columns.Length - 1)
#						columns[i + 1].Height += rDeltas[i];
#				}
#			}
	pass

func _refresh_child():
	if get_viewport() == null:
		# We don't yet have a viewport.
		return
	
	if not has_node("Polygon"):
		var polyNode = Polygon2D.new()
		polyNode.set_name("Polygon")
		add_child(polyNode)
	
	var poly = PoolVector2Array()
	
	poly.append(Vector2(_width,400))
	poly.append(Vector2(0,400))
	var spring = load("res://addons/Test/waterColumn.gd")

	for i in range(0,_width/pixelsPerSpring):
		springs[i] = spring.new()
		poly.append(Vector2(0+pixelsPerSpring*i,0))
	#	
	#poly.append(Vector2(0,0))
	#poly.append(Vector2(300,0))
	
	var polyNode = get_node("Polygon")
	
	polyNode.polygon = poly
	
	pass