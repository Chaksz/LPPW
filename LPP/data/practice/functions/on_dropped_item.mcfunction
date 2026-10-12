# on_dropped_item.mcfunction
# Reset semua skor drop
scoreboard players reset @a drop_lava
scoreboard players reset @a drop_water
scoreboard players reset @a drop_bucket
scoreboard players reset @a drop_pick_w
scoreboard players reset @a drop_pick_s
scoreboard players reset @a drop_pick_i
scoreboard players reset @a drop_pick_g
scoreboard players reset @a drop_pick_d
scoreboard players reset @a drop_pick_n

# Hancurkan item yang baru di-drop agar tidak berserakan di arena
kill @e[type=item, distance=..10]

# Jika pemain jongkok (sneaking): RERUN (restart langsung tanpa ke hub)
execute if predicate practice:sneaking run function practice:rerun

# Jika pemain berdiri (tidak jongkok): STOP (kembali ke hub)
execute unless predicate practice:sneaking run function practice:stop

