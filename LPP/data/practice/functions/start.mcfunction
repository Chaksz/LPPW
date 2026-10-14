# start.mcfunction
# Memulai sesi latihan Lava Pool

# 1. Tandai sesi sebagai aktif dan reset status lama
function practice:timer/stop
scoreboard players set running practice.temp 1
scoreboard players set waiting_for_movement practice.temp 0
weather clear
time set day

# 2. Masuk mode Adventure saat loading agar tidak sengaja menghancurkan blok
gamemode adventure @a

# 3. Pulihkan efek dan muat loadout inventory pemain
effect clear @a
effect give @a minecraft:instant_health 1 4 true
execute as @a run function practice:ui/loadinv

# 4. Pilih alur sesuai mode yang dipilih pemain di hub
execute as @a[scores={practice_mode=0}] at @s run function practice:_start/terrain
execute as @a[scores={practice_mode=1}] at @s run function practice:_start/no_terrain