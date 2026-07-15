extends Control

var kembalian_sementara: int = 0
var total_belanja: int = 0
var uang_diterima: int = 0

# Mengambil node teks kembalian
@onready var teks_kembalian = $panelkiri/TeksKembalian 

func _ready():
	update_teks_kembalian()

# Fungsi ini dipanggil tiap kali pemain klik tombol uang
func tambah_uang(nominal: int):
	kembalian_sementara += nominal
	update_teks_kembalian()

# Fungsi untuk memperbarui teks di layar kiri
func update_teks_kembalian():
	teks_kembalian.text = "Kembalian : Rp " + str(kembalian_sementara)

# Fungsi untuk tombol UNDO
func _on_btn_undo_pressed():
	kembalian_sementara = 0
	update_teks_kembalian()

# ==========================================
# FINAL TAHAP 2: Logika Pengecekan Kembalian
# ==========================================
func _on_btn_enter_pressed():
	# Mesin kasir menghitung berapa kembalian yang seharusnya
	var kembalian_seharusnya = uang_diterima - total_belanja
	
	print("Kembalian yang dikasih pemain: Rp ", kembalian_sementara)
	print("Kembalian seharusnya: Rp ", kembalian_seharusnya)
	
	# Mengecek hasil kerja pemain
	if kembalian_sementara == kembalian_seharusnya:
		print("BENAR! Pelanggan puas!")
		self.visible = false # Menutup pop-up pembayaran karena sukses
		
		# Reset kembalian sementara untuk pelanggan berikutnya
		kembalian_sementara = 0 
		update_teks_kembalian()
		
	elif kembalian_sementara < kembalian_seharusnya:
		print("SALAH! Kembaliannya kurang!")
		# Nanti pop-up Ibu marah bisa dimunculkan di sini
		
	else:
		print("SALAH! Kembaliannya kelebihan, toko bisa rugi!")
		# Nanti pop-up Ibu marah bisa dimunculkan di sini


# ==========================================
# Tombol-tombol Pecahan Uang
# ==========================================
func _on_texture_button_pressed() -> void:
	tambah_uang(1000)

func _on_texture_button_2_pressed() -> void:
	tambah_uang(2000)

func _on_texture_button_3_pressed() -> void:
	tambah_uang(5000)

func _on_texture_button_4_pressed() -> void:
	tambah_uang(10000)

func _on_texture_button_5_pressed() -> void:
	tambah_uang(20000)

func _on_texture_button_6_pressed() -> void:
	tambah_uang(50000)

func _on_texture_button_7_pressed() -> void:
	tambah_uang(100000)

func _on_texture_button_8_pressed() -> void:
	tambah_uang(500)
