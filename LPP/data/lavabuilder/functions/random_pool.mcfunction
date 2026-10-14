# random_pool.mcfunction
# Sistem pemilih lava pool dan rotasi menggunakan UUID entity sementara sebagai sumber entropy.
# Teknik ini kompatibel 100% dengan Minecraft 1.16.1 (tidak perlu /random dari 1.20+).

# Summon entity RNG sementara (UUID-nya unik setiap dipanggil)
summon area_effect_cloud ~ ~ ~ {Tags:["pool_rng"], Duration:1}

# Ambil dua bagian UUID sebagai bilangan acak untuk bentuk pool dan rotasi
execute store result score pool_roll practice.temp run data get entity @e[tag=pool_rng,limit=1,sort=nearest] UUID[0] 1
execute store result score pool_rotation practice.temp run data get entity @e[tag=pool_rng,limit=1,sort=nearest] UUID[1] 1

# Hapus entity RNG segera
kill @e[tag=pool_rng]

# Modulo lalu normalkan hasil negatif menjadi rentang valid
scoreboard players operation pool_roll practice.temp %= #15_pools practice.temp
execute if score pool_roll practice.temp matches ..-1 run scoreboard players add pool_roll practice.temp 15

scoreboard players operation pool_rotation practice.temp %= #4_rotations practice.temp
execute if score pool_rotation practice.temp matches ..-1 run scoreboard players add pool_rotation practice.temp 4

# Dispatch ke fungsi yang memuat semua pool dengan rotasi terpilih
execute as @e[type=area_effect_cloud,tag=chunk_aligned,limit=1] at @s if score pool_rotation practice.temp matches 0 run function lavabuilder:load_rotation_0
execute as @e[type=area_effect_cloud,tag=chunk_aligned,limit=1] at @s if score pool_rotation practice.temp matches 1 run function lavabuilder:load_rotation_1
execute as @e[type=area_effect_cloud,tag=chunk_aligned,limit=1] at @s if score pool_rotation practice.temp matches 2 run function lavabuilder:load_rotation_2
execute as @e[type=area_effect_cloud,tag=chunk_aligned,limit=1] at @s if score pool_rotation practice.temp matches 3 run function lavabuilder:load_rotation_3
