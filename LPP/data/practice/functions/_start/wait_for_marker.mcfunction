# Coba eksekusi fase berikutnya JIKA marker merespons
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s run function practice:_start/post_load

# JIKA marker belum merespons, jadwalkan ulang fungsi ini di tick depan
execute unless entity @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] run schedule function practice:_start/wait_for_marker 1t