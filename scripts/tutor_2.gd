extends Node2D

@onready var teks_dialog = $Label
@onready var tombol_next = $Button

# Ambil referensi objek yang ada di meja kasir
@onready var sprite_ibu = $AreaKasir/ibu2
@onready var alat_monitor = $AreaKasir/Meja/monitor
@onready var mesin_edc = $AreaKasir/MesinEDC

# --- PERUBAHAN: Daftar dialog sekarang digabung dengan pose gambar Ibu ---
var daftar_dialog: Array = [
	{
		"teks": "Nah, sekarang kita sudah ada di area meja kasir. Perhatikan baik-baik ya!",
		"pose": preload("res://assets/aset/character/CharacterIbu4RemovebgPreview.png")
	},
	{
		"teks": "Ini adalah Monitor dan area Scanner. Gunakan alat ini untuk memindai dan menghitung total belanjaan pembeli.",
		"pose": preload("res://assets/aset/character/CharacterIbu2RemovebgPreview.png")
	},
	{
		"teks": "Lalu di sebelahnya ada Mesin EDC dan laci uang. Pastikan kamu menghitung uang kembalian dengan pas agar toko tidak rugi!",
		"pose": preload("res://assets/aset/character/CharacterIbu3RemovebgPreview.png")
	},
	{
		"teks": "Oh ya, ada satu aturan yang PALING PENTING di toko kita...",
		"pose": preload("res://assets/aset/character/CharacterIbu4RemovebgPreview.png")
	},
	{
		"teks": "Barang khusus dewasa seperti ROKOK dilarang keras dijual kepada anak di bawah umur!",
		"pose": preload("res://assets/aset/character/ibu/character_ibu_5-removebg-preview (1).png")
	},
	{
		"teks": "Kalau ada anak kecil yang membawa rokok ke kasir, kamu wajib menolak transaksinya. Paham kan?",
		"pose": preload("res://assets/aset/character/CharacterIbu4RemovebgPreview.png")
	},
	{
		"teks": "Bagus! Sekarang, mari kita praktek langsung melayani pelanggan pertama.",
		"pose": preload("res://assets/aset/character/CharacterIbu2RemovebgPreview.png")
	}
]

var indeks_sekarang: int = 0

func _ready():
	update_dialog()

func update_dialog():
	if indeks_sekarang < daftar_dialog.size():
		var dialog_aktif = daftar_dialog[indeks_sekarang]
		
		# Ganti teks dan ganti pose ibu sekaligus
		teks_dialog.text = dialog_aktif["teks"]
		sprite_ibu.texture = dialog_aktif["pose"]
		
		# Jalankan efek mengetik
		teks_dialog.visible_ratio = 0.0
		var tween = create_tween()
		tween.tween_property(teks_dialog, "visible_ratio", 1.0, 1.2)
		
		# Panggil fungsi untuk menyorot/menggerakkan alat sesuai topik dialog
		sorot_alat(indeks_sekarang)
	else:
		# Tutorial selesai, langsung mulai main gamenya!
		get_tree().change_scene_to_file("res://scenes/MainGame.tscn")

# --- EFEK VISUAL: BIKIN ALAT MANTUL SAAT DIBAHAS ---
func sorot_alat(indeks: int):
	if indeks == 1: # Saat obrolan ke-2 (indeks 1)
		bikin_mantul(alat_monitor)
	elif indeks == 2: # Saat obrolan ke-3 (indeks 2)
		bikin_mantul(mesin_edc)

func bikin_mantul(objek):
	var tween = create_tween()
	var posisi_asli_y = objek.position.y
	# Naik 20 pixel dengan efek mantul
	tween.tween_property(objek, "position:y", posisi_asli_y - 20, 0.3).set_trans(Tween.TRANS_BOUNCE)
	# Turun lagi
	tween.tween_property(objek, "position:y", posisi_asli_y, 0.3).set_trans(Tween.TRANS_BOUNCE)

# Jangan lupa hubungkan sinyal (pressed) dari tombol_next ke fungsi ini
func _on_button_pressed():
	indeks_sekarang += 1
	update_dialog()
