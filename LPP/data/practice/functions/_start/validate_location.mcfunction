# validate_location.mcfunction
# Validate the candidate and the terrain under the lava pool footprint.
tag @s remove valid_location
tag @s remove invalid_location
scoreboard players add @s terrain_attempt 1
scoreboard players set @s terrain_samples 0

execute if block ~ ~-1 ~ #practice:valid_terrain run tag @s add valid_location

execute unless entity @s[tag=valid_location] run tag @s add invalid_location

# Sample a 3x3 grid across every pool variant's occupied footprint (x -6..8, z 2..16).
execute if entity @s[tag=valid_location] positioned ~-6 ~ ~2 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~1 ~ ~2 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~8 ~ ~2 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~-6 ~ ~9 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~1 ~ ~9 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~8 ~ ~9 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~-6 ~ ~16 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~1 ~ ~16 run function practice:_start/sample_terrain
execute if entity @s[tag=valid_location] positioned ~8 ~ ~16 run function practice:_start/sample_terrain

execute if entity @s[tag=valid_location] unless score @s terrain_samples matches 9 run tag @s add invalid_location
execute if entity @s[tag=valid_location] if score @s terrain_samples matches 9 run scoreboard players operation @s terrain_range = @s terrain_max
execute if entity @s[tag=valid_location] if score @s terrain_samples matches 9 run scoreboard players operation @s terrain_range -= @s terrain_min
# Up to two blocks of height variation is acceptable across the pool footprint.
execute if entity @s[tag=valid_location] if score @s terrain_range matches 3.. run tag @s add invalid_location
execute if entity @s[tag=invalid_location] run tag @s remove valid_location

# Retry unsuitable candidates, but accept the final candidate as a fallback so
# terrain validation can never prevent the lava pool from being generated.
execute if entity @s[tag=invalid_location] if score @s terrain_attempt matches ..9 run tag @s add awaiting_respread
execute if entity @s[tag=invalid_location] if score @s terrain_attempt matches ..9 run schedule function practice:_start/requeue_validation 1t replace
execute if entity @s[tag=invalid_location] if score @s terrain_attempt matches 10.. run function practice:_start/create_aligned_marker
execute if entity @s[tag=valid_location] run function practice:_start/create_aligned_marker
