# set_home.mcfunction
# Simpan posisi awal pemain saat spawn
execute as @a run function practice:_start/movement_detection/get_current_pos

scoreboard players operation $home.x playerpos = $current.x playerpos
scoreboard players operation $home.z playerpos = $current.z playerpos
scoreboard players set $moved playerpos 0
scoreboard players reset @a jumps

