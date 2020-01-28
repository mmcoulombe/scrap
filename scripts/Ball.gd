extends KinematicBody2D

var over = false

func _physics_process(delta: float) -> void:
        var mouse_position = get_viewport().get_mouse_position()
        position += mouse_position - global_position

func _on_Control_mouse_entered() -> void:
    over = true

func _on_Control_mouse_exited() -> void:
    over = false
