# Ambil ID Slot dari item TERAKHIR di array (index [-1])
execute store result score slot_num practice.temp run data get storage lpp:inventory selected.inventory_all[-1].Slot

# Kirim item ke laci yang sesuai dengan ID Slot-nya
execute if score slot_num practice.temp matches -106 run function practice:ui/store_offhand
execute if score slot_num practice.temp matches 100..103 run function practice:ui/store_armor
execute if score slot_num practice.temp matches 9..35 run function practice:ui/store_inventory

# Khusus Hotbar (Slot 0-8), ID Slot-nya tidak perlu diubah, jadi langsung pindahkan
execute if score slot_num practice.temp matches 0..8 run data modify storage lpp:inventory selected.hotbar append from storage lpp:inventory selected.inventory_all[-1]

# Hapus item terakhir yang sudah diproses dari array sementara
data remove storage lpp:inventory selected.inventory_all[-1]

# Jika masih ada item tersisa di array, ulangi fungsi ini
execute if data storage lpp:inventory selected.inventory_all[] run function practice:ui/sortinv_rec