extends Actor

func _on_EnemyDetector_area_entered(area: Area2D) -> void:
    pass

func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
    queue_free()

func _physics_process(delta: float) -> void:
    var direction = get_direction()
    _velocity = calculate_move_velocity(_velocity, direction, speed)
    _velocity = move_and_slide(_velocity, FLOOR_NORMAL, true)
    # if (Input.is_action_just_pressed('ui_up')):
    #    $Camera2D.increase_shake_intensity(2.0)

func get_direction() -> Vector2:
    return Vector2(
        Input.get_action_strength('move_right') - Input.get_action_strength('move_left'),
        -1.0 if Input.is_action_just_pressed('jump') and is_on_floor() else 1.0
    )

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
    var out_vel = linear_velocity
    out_vel.x = speed.x * direction.x
    out_vel.y += gravity * get_physics_process_delta_time()
    if direction.y == -1.0:
        out_vel.y = speed.y * direction.y

    return out_vel
