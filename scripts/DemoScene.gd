extends Node2D

func _ready() -> void:
    $LightPole/Lantern/AnimationPlayer.play('glow')

func _process(delta: float) -> void:
    $FPS.text = "FPS: %d" % Engine.get_frames_per_second()
