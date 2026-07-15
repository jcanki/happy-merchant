extends Node2D

@onready var pelanggan = $AreaKasir/pelanggan
@onready var titik_berhenti = $AreaKasir/TitikPelanggan 

func _ready():
	# X = 1300 biar pelanggan sembunyi di kanan layar dulu
	pelanggan.position = Vector2(1300, titik_berhenti.position.y)
	pelanggan_masuk()

func pelanggan_masuk():
	var tween = create_tween()
	tween.tween_property(pelanggan, "position:x", titik_berhenti.position.x, 2.5)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)
