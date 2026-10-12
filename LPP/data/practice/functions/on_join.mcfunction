# 1. Berikan tag agar game tahu pemain ini sudah pernah login (untuk deteksi pemain baru)
tag @s add joined

# 2. Reset skor leave_game kembali ke 0 agar fungsi ini tidak berjalan berulang-ulang
scoreboard players set @s leave_game 0

# 3. Jalankan prosedur reset/stop total (mengembalikan pemain ke Hub & membersihkan arena)
function practice:stop

# 4. (Opsional) Beri sapaan atau notifikasi
tellraw @s {"text":"Welcome back! Latihan di-reset.","color":"aqua","italic":true}