# Pertahankan alur terrain acak yang sudah ada.
tag @s remove awaiting_respread
scoreboard players set @s terrain_attempt 0
spreadplayers 0 0 100 100000 false @s
execute at @s run function practice:_start/validate_location
