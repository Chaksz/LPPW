# _portal_finish.mcfunction
# Dijalankan SEKALI saat portal berhasil dinyalakan.

# 1. Hentikan status sesi & timer SEKETIKA agar tidak bisa dipanggil ulang
scoreboard players set running practice.temp 0
scoreboard players set timer_active practice.temp 0
scoreboard players set waiting_for_movement practice.temp 0
function practice:timer/stop
schedule clear practice:_start/wait_for_movement/wait
schedule clear practice:_start/clear_forceload

# 2. Mainkan suara selesai
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1

# 3. Tampilkan title waktu
title @a subtitle [{"text":"Time: ","color":"gray"},{"score":{"name":"minutes","objective":"practice.timer"},"color":"gold"},{"text":":","color":"gold"},{"nbt":"seconds","storage":"practice:timer","interpret":true,"color":"gold"},{"text":".","color":"yellow"},{"nbt":"sub_seconds","storage":"practice:timer","interpret":true,"color":"yellow"}]

# 4. Kirim hasil waktu ke chat (HANYA SEKALI)
tellraw @a ["",{"text":"[LPP] ","color":"dark_aqua","bold":true},{"text":"Portal selesai! Waktu: ","color":"green"},{"score":{"name":"minutes","objective":"practice.timer"},"color":"gold"},{"text":":","color":"gold"},{"nbt":"seconds","storage":"practice:timer","interpret":true,"color":"gold"},{"text":".","color":"yellow"},{"nbt":"sub_seconds","storage":"practice:timer","interpret":true,"color":"yellow"}]

# 5. Bersihkan efek dan barang latihan
effect clear @a
clear @a

# 6. Musnahkan item drop, marker arena, dan hapus forceload
kill @e[type=item, distance=..50]
kill @e[type=area_effect_cloud, tag=chunk_aligned]
forceload remove all

# 7. LANGSUNG TELEPORTASI PEMAIN KEMBALI KE SPAWN / HUB
function practice:hub_teleport
gamemode adventure @a
