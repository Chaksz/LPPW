# tick.mcfunction
# Dijalankan setiap tick (20x/detik) hanya saat sesi latihan sedang aktif (running=1).

# 1. Update Stopwatch Timer jika aktif
execute if score timer_active practice.temp matches 1 run function practice:timer/tick

# 2. Deteksi saat Nether Portal Dinyalakan (blok nether_portal terbentuk)
scoreboard players set portal_found practice.temp 0

# Cek A: Area sekitar arena lava pool
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s store result score portal_found practice.temp in overworld run clone ~-10 ~-2 ~-2 ~10 ~6 ~14 100 250 100 filtered minecraft:nether_portal force

# Cek B: Area sekitar pemain (jangkauan tangan saat menyalakan portal)
execute if score portal_found practice.temp matches 0 as @a at @s store result score portal_found practice.temp in overworld run clone ~-5 ~-2 ~-5 ~5 ~4 ~5 100 250 100 filtered minecraft:nether_portal force

# Jika portal menyala -> bersihkan buffer langit & jalankan portal_success
execute if score portal_found practice.temp matches 1.. in overworld run fill 100 250 100 120 255 120 air
execute if score portal_found practice.temp matches 1.. run function practice:portal_success

# 3. Fallback: Deteksi pemain berada di dalam blok portal
execute as @a at @s if block ~ ~ ~ minecraft:nether_portal run function practice:portal_success
execute as @a at @s if block ~ ~1 ~ minecraft:nether_portal run function practice:portal_success

# 4. Deteksi Kematian Pemain
execute as @e[type=player, scores={deaths=1..}] at @s run function practice:on_death

# 5. Deteksi Pembuangan Item (Pickaxe / Bucket) untuk Reset atau Rerun
execute as @a[predicate=practice:dropped_reset] at @s run function practice:on_dropped_item

# 6. Fitur Bantuan: Lempar telur untuk reload lava pool
execute as @a[scores={throw_egg=1..}] at @s run scoreboard players set pool_roll practice.temp 0
execute as @a[scores={throw_egg=1..}] at @s run function lavabuilder:load_rotation_0
execute as @a[scores={throw_egg=1..}] run scoreboard players reset @s throw_egg
