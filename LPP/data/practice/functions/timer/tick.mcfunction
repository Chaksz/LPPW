# timer/tick.mcfunction
# Tambah tick counter
scoreboard players add ticks practice.timer 1

# Hitung menit
scoreboard players operation minutes practice.timer = ticks practice.timer
scoreboard players operation minutes practice.timer /= #1200 practice.timer

# Hitung detik (0..59)
scoreboard players operation seconds practice.timer = ticks practice.timer
scoreboard players operation seconds practice.timer /= #20 practice.timer
scoreboard players operation seconds practice.timer %= #60 practice.timer

# Hitung sub-detik / hundredths (00..95)
scoreboard players operation sub_sec practice.timer = ticks practice.timer
scoreboard players operation sub_sec practice.timer %= #20 practice.timer
scoreboard players operation sub_sec practice.timer *= #5 practice.temp

# Format padding detik 2 digit
data modify storage practice:timer seconds set value [0, 0]
execute if score seconds practice.timer matches 10.. run data remove storage practice:timer seconds[1]
execute store result storage practice:timer seconds[-1] int 1 run scoreboard players get seconds practice.timer

# Format padding sub-detik 2 digit
data modify storage practice:timer sub_seconds set value [0, 0]
execute if score sub_sec practice.timer matches 10.. run data remove storage practice:timer sub_seconds[1]
execute store result storage practice:timer sub_seconds[-1] int 1 run scoreboard players get sub_sec practice.timer

# Tampilkan live timer di actionbar
title @a actionbar [{"text":"Timer: ","color":"gray"},{"score":{"name":"minutes","objective":"practice.timer"},"color":"white"},{"text":":","color":"white"},{"nbt":"seconds","storage":"practice:timer","interpret":true,"color":"white"},{"text":".","color":"yellow"},{"nbt":"sub_seconds","storage":"practice:timer","interpret":true,"color":"yellow"}]

