# Pilihan tersimpan per pemain; tampilan sign menunjukkan pilihan terakhir.
execute unless score @s practice_mode matches 0..1 run scoreboard players set @s practice_mode 0
scoreboard players add @s practice_mode 1
execute if score @s practice_mode matches 1 run function practice:ui/select_no_terrain
execute if score @s practice_mode matches 2 run function practice:ui/select_terrain
