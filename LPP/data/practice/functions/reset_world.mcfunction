# reset_world.mcfunction
# Membersihkan item yang tercecer di sekitar arena latihan
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s run kill @e[type=item, distance=..32]
