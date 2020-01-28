extends KinematicBody2D
class_name Actor


const FLOOR_NORMAL = Vector2.UP

export(Vector2) var speed = Vector2(300.0, 1000.0)
export(float) var gravity = 4000.0

var _velocity = Vector2.ZERO
