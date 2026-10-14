# Pertahankan posisi dan arah pemain yang ditetapkan untuk arena no-terrain.
tp @s 1001.29 231.00 1008.76 182.94 26.46

# Geser pusat lava pool 5 blok horizontal ke depan tanpa mengubah loader terrain.
kill @e[type=area_effect_cloud,tag=chunk_aligned]
execute at @s rotated ~ 0 positioned ^ ^ ^5 run summon area_effect_cloud ~-0.5 ~ ~-8.5 {Tags:["chunk_aligned"],Duration:2147483647}
execute as @e[type=area_effect_cloud,tag=chunk_aligned,limit=1] at @s run function practice:_start/generate_structure

schedule function practice:_start/clear_forceload 3s
function practice:_start/wait_for_movement/start