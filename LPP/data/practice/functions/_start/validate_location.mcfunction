# validate_location.mcfunction
# Cek apakah pemain mendarat di permukaan tanah alami yang solid
tag @s remove valid_location
tag @s remove invalid_location

execute if block ~ ~-1 ~ minecraft:grass_block run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:dirt run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:sand run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:stone run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:gravel run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:sandstone run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:podzol run tag @s add valid_location
execute if block ~ ~-1 ~ minecraft:coarse_dirt run tag @s add valid_location

execute unless entity @s[tag=valid_location] run tag @s add invalid_location

# Jika mendarat di air / pohon / laut, lempar ulang
execute if entity @s[tag=invalid_location] run tag @s add awaiting_respread
execute if entity @s[tag=invalid_location] run schedule function practice:_start/requeue_validation 1t replace

# Jika valid: lanjut ke pembuatan marker arena
execute if entity @s[tag=valid_location] run function practice:_start/create_aligned_marker
