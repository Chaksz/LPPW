# create_aligned_marker.mcfunction
# Dijalankan di posisi pemain yang sudah tervalidasi di atas tanah padat.

# Bersihkan marker lama
kill @e[type=area_effect_cloud, tag=chunk_aligned]

# Buat marker baru di ketinggian tanah yang valid
summon area_effect_cloud ~ ~ ~ {Tags:["chunk_aligned"], Duration: 2147483647}

# Eksekusi fase berikutnya di posisi marker
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s run function practice:_start/post_load
