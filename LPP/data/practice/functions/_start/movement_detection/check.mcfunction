# check.mcfunction
# Cek apakah koordinat pemain sudah bergeser atau pemain melompat
execute as @a run function practice:_start/movement_detection/get_current_pos

scoreboard players set $moved playerpos 0

execute unless score $current.x playerpos = $home.x playerpos run scoreboard players set $moved playerpos 1
execute unless score $current.z playerpos = $home.z playerpos run scoreboard players set $moved playerpos 1
execute as @a if score @s jumps matches 1.. run scoreboard players set $moved playerpos 1

