# start.mcfunction
# Masuk ke mode Adventure sementara agar timer belum berjalan
gamemode adventure @a

# Catat posisi awal
function practice:_start/movement_detection/set_home

scoreboard players set waiting_for_movement practice.temp 1
title @a actionbar {"text":"Waiting for movement...","italic":true,"color":"yellow"}

schedule function practice:_start/wait_for_movement/wait 1t replace

