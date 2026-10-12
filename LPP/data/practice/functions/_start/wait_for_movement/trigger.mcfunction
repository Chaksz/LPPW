# trigger.mcfunction
# Pemain sudah bergerak: matikan flag wait, kembalikan survival, dan jalankan stopwatch
scoreboard players set waiting_for_movement practice.temp 0
gamemode survival @a

playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 0.6 1.8

function practice:timer/start

