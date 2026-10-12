# post_load.mcfunction
# Dijalankan di posisi marker arena (ketinggian tanah).

# 1. Kunci chunk di sekitar area latihan
forceload add ~-16 ~-16 ~16 ~16

# 2. Posisikan pemain di depan lava pool, menghadap lurus ke depan (selatan / Z+)
tp @a ~ ~ ~-2 0 10

# 3. Muat struktur lava pool
function practice:_start/generate_structure

# 4. Lepaskan kunci chunk setelah beberapa detik
schedule function practice:_start/clear_forceload 3s

# 5. Masuk ke fase "Waiting for movement"
function practice:_start/wait_for_movement/start