extends Control

#========================================================
#                REFERENSI NODE
#========================================================

# Awan
@onready var awan1 = $awan
@onready var awan2 = $awan2
@onready var awan3 = $awan3

# Pohon
@onready var pohon_kiri = $toko/pohon
@onready var pohon_kanan = $toko/pohon2

# Semak
@onready var semak_kiri = $toko/semak
@onready var semak_tengah = $toko/semak2
@onready var semak_pohon_kiri = $toko/pohon/semak2
@onready var semak_pohon_kanan = $toko/pohon2/semak2

# Rumput
@onready var rumput_pagar1 = $pagar/rumput
@onready var rumput_pagar2 = $"pagar 2/rumput"

# Bunga
@onready var bunga = $"bunga kecil"

# Tombol
@onready var btn_start = $btnstart
@onready var btn_exit = $btnexit
@onready var btn_setting = $btnsetting


#========================================================
#                     READY
#========================================================

func _ready():

	#======================
	# AWAN
	#======================
	if awan1:
		animasi_awan(awan1, 20, 35)

	if awan2:
		animasi_awan(awan2, 18, -30)

	if awan3:
		animasi_awan(awan3, 16, 25)

	#======================
	# POHON
	#======================
	if pohon_kiri:
		animasi_angin(pohon_kiri, 3.5, 3)

	if pohon_kanan:
		animasi_angin(pohon_kanan, 3.0, 3)

	#======================
	# SEMAK
	#======================
	if semak_kiri:
		animasi_angin(semak_kiri, 3.0, 2)

	if semak_tengah:
		animasi_angin(semak_tengah, 2.8, 2)

	if semak_pohon_kiri:
		animasi_angin(semak_pohon_kiri, 2.5, 1.5)

	if semak_pohon_kanan:
		animasi_angin(semak_pohon_kanan, 2.5, 1.5)

	#======================
	# RUMPUT
	#======================
	if rumput_pagar1:
		animasi_angin(rumput_pagar1, 4.5, 1)

	if rumput_pagar2:
		animasi_angin(rumput_pagar2, 4.5, 1)

	#======================
	# BUNGA
	#======================
	if bunga:
		animasi_angin(bunga, 5.0, 1)

	#======================
	# TOMBOL
	#======================
	if btn_start:
		animasi_tombol(btn_start, true)

	if btn_exit:
		animasi_tombol(btn_exit, false)

	if btn_setting:
		animasi_tombol(btn_setting, true)


#========================================================
#                 FUNGSI ANIMASI
#========================================================

func animasi_awan(objek, durasi, jarak):

	var tween = create_tween()
	tween.set_loops()

	var awal = objek.position.x

	tween.tween_property(
		objek,
		"position:x",
		awal + jarak,
		durasi / 2
	).set_trans(Tween.TRANS_SINE)

	tween.tween_property(
		objek,
		"position:x",
		awal,
		durasi / 2
	).set_trans(Tween.TRANS_SINE)


func animasi_angin(objek, durasi, jarak):

	var tween = create_tween()
	tween.set_loops()

	var awal = objek.position.x

	tween.tween_property(
		objek,
		"position:x",
		awal + jarak,
		durasi / 2
	).set_trans(Tween.TRANS_SINE)

	tween.tween_property(
		objek,
		"position:x",
		awal - jarak,
		durasi / 2
	).set_trans(Tween.TRANS_SINE)


func animasi_tombol(tombol, naik):

	var tween = create_tween()
	tween.set_loops()

	var awal = tombol.position.y

	var target

	if naik:
		target = awal - 4
	else:
		target = awal + 4

	tween.tween_property(
		tombol,
		"position:y",
		target,
		1.4
	).set_trans(Tween.TRANS_SINE)

	tween.tween_property(
		tombol,
		"position:y",
		awal,
		1.4
	).set_trans(Tween.TRANS_SINE)


#========================================================
#                 TOMBOL
#========================================================

func _on_btnstart_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial_game.tscn")


func _on_btnexit_pressed():
	get_tree().quit()


func _on_btnsetting_pressed():
	print("Setting")
