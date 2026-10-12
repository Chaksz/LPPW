# 1. Hentikan semua antrean pencarian terrain & koordinat yang sedang berjalan
schedule clear practice:_start/validate_location
schedule clear practice:_start/wait_for_marker

# 2. Reset skor deteksi agar tidak terjadi looping reset
scoreboard players reset @a drop_lava
scoreboard players reset @a drop_water
scoreboard players reset @a drop_bucket
scoreboard players reset @a drop_pick_w
scoreboard players reset @a drop_pick_s
scoreboard players reset @a drop_pick_i
scoreboard players reset @a drop_pick_g
scoreboard players reset @a drop_pick_d
scoreboard players reset @a drop_pick_n
scoreboard players reset @a deaths


# Tambahan: Hapus item yang baru saja di-drop agar tidak berserakan di arena.
# Radius 10 blok memastikan barang di arena hancur, tanpa mengganggu barang di Hub.
kill @e[type=item,distance=..10]

# 3. Hapus tag penanda portal yang sedang menunggu chek
tag @a remove portal_checking
tag @a remove portal_detected

# 4. Bersihkan efek status dan isi inventory pemain untuk sesi berikutnya
effect clear @a
clear @a

# 5. Bersihkan sisa bangunan latihan (lava/air/obsidian dll) SEBELUM marker dihapus,
#    karena reset_world.mcfunction butuh posisi marker sebagai acuan area
function practice:reset_world

# 6. Musnahkan kursor/marker AEC agar tidak menumpuk di memori dunia
kill @e[type=area_effect_cloud, tag=chunk_aligned]

# 7. KEMBALI KE HUB OVERWORLD
function practice:hub_teleport

# 8. Set status run menjadi berhenti (0) -> tick_gate otomatis berhenti polling
scoreboard players set running practice.temp 0