extends Node2D

@onready var teks_dialog = $Label
@onready var tombol_next = $Button
@onready var sprite_ibu = $CharacterIbu2RemovebgPreview # Mengakses 1 node Ibu di scene

# Kita panggil file dari folder bawah (FileSystem) langsung ke dalam kode
var daftar_dialog: Array = [
	{
		"teks": "Hallo selamat datang di Happy Merchant",
		"pose": preload("res://assets/aset/character/CharacterIbu4RemovebgPreview.png")
	},
	{
		"teks": "Di sini, Ibu mau ngajarin kamu gimana jadi kasir yang baik.",
		"pose": preload("res://assets/aset/character/CharacterIbu2RemovebgPreview.png")
	},
	{
		"teks": "Kunci utama toko kita adalah TELITI dan JUJUR.",
		"pose": preload("res://assets/aset/character/CharacterIbu3RemovebgPreview.png")
	},
	{
		"teks": "Kalau ada pelanggan bayar, hitung uang kembaliannya dengan pas ya!",
		"pose": preload("res://assets/aset/character/ibu/character_ibu_5-removebg-preview (1).png")
	},
	{
		"teks": "Yuk, sekarang kita langsung menuju ke meja kasir!",
		"pose": preload("res://assets/aset/character/CharacterIbu3RemovebgPreview.png")
	}
]

var indeks_sekarang: int = 0

func _ready():
	update_dialog()

func update_dialog():
	if indeks_sekarang < daftar_dialog.size():
		var dialog_aktif = daftar_dialog[indeks_sekarang]
		
		# Sihir kodenya: 1 node ganti teks dan ganti gambar secara bersamaan
		teks_dialog.text = dialog_aktif["teks"]
		sprite_ibu.texture = dialog_aktif["pose"]
		
		# --- TAMBAHAN EFEK TEKS BERJALAN ---
		teks_dialog.visible_ratio = 0.0 # Mulai dari teks kosong (0%)
		
		var tween = create_tween()
		# Angka 1.5 adalah durasi teks ngetik sampai selesai (dalam detik). 
		# Kalau kemanisan/kelamaan, tinggal kamu ganti jadi 1.0 atau 0.8 ya!
		tween.tween_property(teks_dialog, "visible_ratio", 1.0, 1.5)
		# ------------------------------------
	else:
		get_tree().change_scene_to_file("res://scenes/tutor2.tscn")

func _on_next_button_pressed():
	indeks_sekarang += 1
	update_dialog()
