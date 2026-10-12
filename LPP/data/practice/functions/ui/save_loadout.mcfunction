# 1. Jalankan mesin ekstrak inventory
execute as @s run function practice:ui/storeinv

# 2. Pastikan ada slot terpilih, lalu simpan hasilnya dari "selected" ke slot aktif
execute unless data storage lpp:inventory loadouts[{selected:1b}] run data modify storage lpp:inventory loadouts[0].selected set value 1b
data modify storage lpp:inventory loadouts[{selected:1b}] set from storage lpp:inventory selected

# 3. Kembalikan teks Sign menjadi [Edit] berwarna emas
data merge block 98 65 100 {Text3:'{"text":"[Edit]","color":"gold","clickEvent":{"action":"run_command","value":"function practice:ui/edit_loadout"}}'}

# 4. Kembalikan pemain ke mode adventure dan bersihkan sisa barang
gamemode adventure @s
clear @s

# 5. Mainkan suara "klik" 
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

# 6. Cabut tag edit
tag @s remove editing_loadout