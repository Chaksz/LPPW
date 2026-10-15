# Find the highest natural terrain block near this footprint sample.
scoreboard players set @s terrain_probe -99
execute if block ~ ~2 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe 2
execute if score @s terrain_probe matches -99 if block ~ ~1 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe 1
execute if score @s terrain_probe matches -99 if block ~ ~ ~ #practice:valid_terrain run scoreboard players set @s terrain_probe 0
execute if score @s terrain_probe matches -99 if block ~ ~-1 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe -1
execute if score @s terrain_probe matches -99 if block ~ ~-2 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe -2
execute if score @s terrain_probe matches -99 if block ~ ~-3 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe -3
execute if score @s terrain_probe matches -99 if block ~ ~-4 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe -4

# A missing surface at any probe point rejects the whole candidate.
execute if score @s terrain_probe matches -99 run tag @s add invalid_location

# Track the lowest and highest sampled surface relative to the candidate.
execute if score @s terrain_probe matches -4..2 if score @s terrain_samples matches 0 run scoreboard players operation @s terrain_min = @s terrain_probe
execute if score @s terrain_probe matches -4..2 if score @s terrain_samples matches 0 run scoreboard players operation @s terrain_max = @s terrain_probe
execute if score @s terrain_probe matches -4..2 if score @s terrain_probe < @s terrain_min run scoreboard players operation @s terrain_min = @s terrain_probe
execute if score @s terrain_probe matches -4..2 if score @s terrain_probe > @s terrain_max run scoreboard players operation @s terrain_max = @s terrain_probe
execute if score @s terrain_probe matches -4..2 run scoreboard players add @s terrain_samples 1
