# _retry_offset.mcfunction
# Dipanggil oleh /schedule (TANPA konteks). Beda dengan kasus player, marker itu
# entity PERSISTEN dengan tag unik "chunk_aligned" - jadi aman langsung di-reselect
# lewat type+tag tanpa perlu trik tag "awaiting_*" seperti pada player.
execute as @e[type=area_effect_cloud, tag=chunk_aligned, limit=1] at @s run function practice:_start/_apply_marker_offset
