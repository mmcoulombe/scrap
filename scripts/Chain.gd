tool
extends Node2D

const Loop = preload('res://prefabs/chain/Loop.tscn')
const Link = preload('res://prefabs/chain/Link.tscn')

export(int) var loop_count = 1
export (Vector2) var loop_offset = Vector2(0, 26)

func _ready() -> void:
    var parent = $Anchor
    for i in range(loop_count):
        var child = add_loop(parent)
        add_link(parent, child)
        parent = child

func add_loop(parent: Node2D) -> RigidBody2D:
    var loop_inst = Loop.instance()
    loop_inst.position = parent.position + loop_offset
    add_child(loop_inst)
    return loop_inst

func add_link(parent: Node2D, child: Node2D) -> void:
    var pin: Joint2D  = Link.instance()
    pin.node_a = parent.get_path()
    pin.node_b = child.get_path()
    pin.position.y = (child.position.y - parent.position.y) * 0.5
    parent.add_child(pin)
