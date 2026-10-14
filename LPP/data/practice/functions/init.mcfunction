# init.mcfunction
# Dijalankan otomatis oleh tag minecraft:load setiap kali datapack di-(re)load.

scoreboard objectives add practice.temp dummy
scoreboard objectives add practice_mode dummy
scoreboard objectives add playerpos dummy
scoreboard objectives add jumps minecraft.custom:minecraft.jump
scoreboard objectives add deaths deathCount
scoreboard objectives add leave_game minecraft.custom:minecraft.leave_game

# Deteksi Drop Ember
scoreboard objectives add drop_lava minecraft.dropped:minecraft.lava_bucket
scoreboard objectives add drop_water minecraft.dropped:minecraft.water_bucket
scoreboard objectives add drop_bucket minecraft.dropped:minecraft.bucket

# Deteksi Drop Pickaxe (Semua Varian)
scoreboard objectives add drop_pick_w minecraft.dropped:minecraft.wooden_pickaxe
scoreboard objectives add drop_pick_s minecraft.dropped:minecraft.stone_pickaxe
scoreboard objectives add drop_pick_i minecraft.dropped:minecraft.iron_pickaxe
scoreboard objectives add drop_pick_g minecraft.dropped:minecraft.golden_pickaxe
scoreboard objectives add drop_pick_d minecraft.dropped:minecraft.diamond_pickaxe
scoreboard objectives add drop_pick_n minecraft.dropped:minecraft.netherite_pickaxe

scoreboard objectives add throw_egg minecraft.used:minecraft.egg

# Inisialisasi Timer
function practice:timer/init

# Flag global status latihan
scoreboard players set running practice.temp 0
scoreboard players set waiting_for_movement practice.temp 0

# Pilihan skenario aktif (0 = lava_pool_1, 1 = lava_pool_2, 2 = lava_pool_3)
execute unless score scenario practice.temp = scenario practice.temp run scoreboard players set scenario practice.temp 0
execute as @a unless score @s practice_mode matches 0..1 run scoreboard players set @s practice_mode 0

# Konstanta pembantu matematika
scoreboard players set twelve practice.temp 12
scoreboard players set #5 practice.temp 5

# Konstanta untuk random pool selector (15 bentuk pool, 4 rotasi)
scoreboard players set #15_pools practice.temp 15
scoreboard players set #4_rotations practice.temp 4

# Setup slot loadout
execute unless score loadout_index practice.temp = loadout_index practice.temp run scoreboard players set loadout_index practice.temp 0

# Inisialisasi Data Storage jika belum ada
execute unless data storage lpp:inventory loadouts run data modify storage lpp:inventory loadouts set value [{selected:1b}, {}, {}]
execute unless data storage lpp:inventory loadouts[{selected:1b}] run data modify storage lpp:inventory loadouts[0].selected set value 1b
execute if data storage lpp:inventory loadouts[{selected:1b}] run data modify storage lpp:inventory selected set from storage lpp:inventory loadouts[{selected:1b}]

tellraw @a {"text":"[LavaPool Practice] Datapack dimuat & siap digunakan.","color":"green"}
