extends Node2D

# Mengambil node teks dan tombol di scene kamu
@onready var teks_dialog = $Label
@onready var tombol_next = $Button # Sesuaikan jika nama node Button-mu berbeda

# Daftar obrolan si Ibu yang akan muncul berurutan
var daftar_dialog: Array = [
	"Hallo selamat datang di Happy Merchant",
	"Di sini, Ibu mau ngajarin kamu gimana jadi kasir yang baik.",
	"Kunci utama toko kita adalah TELITI dan JUJUR.",
	"Kalau ada pelanggan bayar, hitung uang kembaliannya dengan pas ya!",
	"Yuk, sekarang kita langsung menuju ke meja kasir!"
]

var indeks_sekarang: int = 0

func _ready():
	# Menampilkan dialog pertama saat game baru dibuka
	update_dialog()

func update_dialog():
	if indeks_sekarang < daftar_dialog.size():
		teks_dialog.text = daftar_dialog[indeks_sekarang]
	else:
		# Jika obrolan Ibu sudah habis, otomatis pindah ke scene MainGame kamu
		get_tree().change_scene_to_file("res://scenes/MainGame.tscn")

# Fungsi yang akan berjalan setiap kali tombol Next diklik
func _on_next_button_pressed():
	indeks_sekarang += 1
	update_dialog()
