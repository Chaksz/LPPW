# loadinv.mcfunction
# Memuat item loadout ke inventory pemain menggunakan Shulker Box di spawn chunk (100, 1, 100)

execute in overworld run setblock 100 1 100 white_shulker_box

# ==========================================
# MUAT HOTBAR (Slot 0-8)
# ==========================================
execute in overworld run data modify block 100 1 100 Items set from storage lpp:inventory selected.hotbar
execute in overworld run loot replace entity @s hotbar.0 9 mine 100 1 100 minecraft:air{drop_contents:1b}
execute in overworld run data modify block 100 1 100 Items set value []

# ==========================================
# MUAT TAS UTAMA (Slot 9-35)
# ==========================================
execute in overworld run data modify block 100 1 100 Items set from storage lpp:inventory selected.inventory
execute in overworld run loot replace entity @s inventory.0 27 mine 100 1 100 minecraft:air{drop_contents:1b}
execute in overworld run data modify block 100 1 100 Items set value []

# ==========================================
# MUAT ARMOR (Slot 100-103)
# ==========================================
execute in overworld run data modify block 100 1 100 Items set from storage lpp:inventory selected.armor
execute in overworld run loot replace entity @s armor.feet 4 mine 100 1 100 minecraft:air{drop_contents:1b}
execute in overworld run data modify block 100 1 100 Items set value []

# ==========================================
# MUAT OFFHAND (Slot -106)
# ==========================================
execute in overworld run data modify block 100 1 100 Items set from storage lpp:inventory selected.offhand
execute in overworld run loot replace entity @s weapon.offhand 1 mine 100 1 100 minecraft:air{drop_contents:1b}
execute in overworld run data modify block 100 1 100 Items set value []

# Hapus Shulker Box
execute in overworld run setblock 100 1 100 air