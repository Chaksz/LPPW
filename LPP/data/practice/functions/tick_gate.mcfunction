# tick_gate.mcfunction
# Didaftarkan ke tag minecraft:tick.
# Hanya mengecek join player dan meneruskan ke practice:tick jika sesi aktif.

# Deteksi pemain baru masuk dunia
execute as @a[tag=!joined] run function practice:on_join

# Deteksi pemain reconnect / relog
execute as @a[scores={leave_game=1..}] run function practice:on_join

# Pintu gerbang utama: hanya jalankan tick latihan jika sesi sedang aktif!
execute if score running practice.temp matches 1 run function practice:tick
