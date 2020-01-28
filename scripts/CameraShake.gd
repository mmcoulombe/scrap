extends Camera2D

export var decay = 0.8
export var max_offset = Vector2(100, 75)
export var max_roll = 0.1

var shake_stength = 0.0
var shake_power = 2

onready var noise = OpenSimplexNoise.new()
var noise_y = 0

func _ready() -> void:
    randomize()
    noise.seed = randi()
    noise.period = 4
    noise.octaves = 2

func _process(delta: float) -> void:
    if shake_stength > 0:
        shake_stength = max(shake_stength - decay * delta, 0)
        shake_camera()

func increase_shake_intensity(amount: float) -> void:
    shake_stength = min(shake_stength + amount, 1.0)

func shake_camera() -> void:
    var amount = pow(shake_stength, shake_power)
    noise_y += 1
    rotation = max_roll * amount * noise.get_noise_2d(noise.seed, noise_y)
    offset.x = max_offset.x * amount * noise.get_noise_2d(noise.seed * 2, noise_y)
    offset.y = max_offset.y * amount * noise.get_noise_2d(noise.seed * 3, noise_y)
