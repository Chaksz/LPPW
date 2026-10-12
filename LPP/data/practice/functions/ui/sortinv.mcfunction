# Bersihkan laci penyortiran lama
data remove storage lpp:inventory selected.offhand
data remove storage lpp:inventory selected.armor
data remove storage lpp:inventory selected.hotbar
data remove storage lpp:inventory selected.inventory

# Hitung jumlah total item di dalam inventory_all
execute store result score slot_count practice.temp run data get storage lpp:inventory selected.inventory_all

# Jika ada minimal 1 item, mulai perulangan (loop) penyortiran
execute if score slot_count practice.temp matches 1.. run function practice:ui/sortinv_rec