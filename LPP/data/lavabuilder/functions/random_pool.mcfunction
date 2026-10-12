# random_pool.mcfunction
# Sistem pemilih lava pool acak menggunakan UUID entity sementara sebagai sumber entropy.
# Teknik ini kompatibel 100% dengan Minecraft 1.16.1 (tidak perlu /random dari 1.20+).

# Summon entity RNG sementara (UUID-nya unik setiap dipanggil)
summon area_effect_cloud ~ ~ ~ {Tags:["pool_rng"], Duration:1}

# Ambil UUID[0] sebagai bilangan acak mentah, simpan ke skor
execute store result score pool_roll practice.temp run data get entity @e[tag=pool_rng,limit=1,sort=nearest] UUID[0] 1

# Hapus entity RNG segera
kill @e[tag=pool_rng]

# Buatkan pool_roll menjadi positif jika negatif
execute if score pool_roll practice.temp matches ..-1 run scoreboard players operation pool_roll practice.temp *= neg_one practice.temp

# Modulo 6 → hasil 0..5 → mapping ke pool 1..6
scoreboard players operation pool_roll practice.temp %= #6_pools practice.temp

# Dispatch ke pool yang sesuai
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 0 run function lavabuilder:lava_pool_1
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 1 run function lavabuilder:lava_pool_2
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 2 run function lavabuilder:lava_pool_3
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 3 run function lavabuilder:lava_pool_4
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 4 run function lavabuilder:lava_pool_5
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s if score pool_roll practice.temp matches 5 run function lavabuilder:lava_pool_6

