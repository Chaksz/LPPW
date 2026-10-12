# Ambil data mentah inventory pemain
data modify storage lpp:inventory selected.inventory_all set from entity @s Inventory

# Jalankan mesin sortir
function practice:ui/sortinv

# Hapus array sementara agar memori dunia bersih
data remove storage lpp:inventory selected.inventory_all