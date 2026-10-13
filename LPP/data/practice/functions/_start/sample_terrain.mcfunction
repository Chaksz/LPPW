# Find the highest natural terrain block close to the candidate's Y level.
scoreboard players set @s terrain_probe practice.temp -99
execute if block ~ ~2 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp 2
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~1 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp 1
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~ ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp 0
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~-1 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp -1
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~-2 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp -2
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~-3 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp -3
execute if score @s terrain_probe practice.temp matches -99 if block ~ ~-4 ~ #practice:valid_terrain run scoreboard players set @s terrain_probe practice.temp -4

# A missing surface at any probe point rejects the whole candidate.
execute if score @s terrain_probe practice.temp matches -99 run tag @s add invalid_location

# Track the lowest and highest sampled surface relative to the candidate.
execute if score @s terrain_probe practice.temp matches -4..2 if score @s terrain_samples practice.temp matches 0 run scoreboard players operation @s terrain_min practice.temp = @s terrain_probe practice.temp
execute if score @s terrain_probe practice.temp matches -4..2 if score @s terrain_samples practice.temp matches 0 run scoreboard players operation @s terrain_max practice.temp = @s terrain_probe practice.temp
execute if score @s terrain_probe practice.temp matches -4..2 if score @s terrain_probe practice.temp < @s terrain_min practice.temp run scoreboard players operation @s terrain_min practice.temp = @s terrain_probe practice.temp
execute if score @s terrain_probe practice.temp matches -4..2 if score @s terrain_probe practice.temp > @s terrain_max practice.temp run scoreboard players operation @s terrain_max practice.temp = @s terrain_probe practice.temp
execute if score @s terrain_probe practice.temp matches -4..2 run scoreboard players add @s terrain_samples practice.temp 1
