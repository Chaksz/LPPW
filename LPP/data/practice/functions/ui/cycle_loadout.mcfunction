# 1. Peringatan jika sedang dalam mode Edit (menggunakan tag dari edit_loadout)
execute if entity @s[tag=editing_loadout] run tellraw @s {"text":"Simpan [Save] loadout-mu dulu!","color":"red"}

# 2. Tambah nomor slot (HANYA jika tidak sedang mengedit)
execute unless entity @s[tag=editing_loadout] run scoreboard players add loadout_index practice.temp 1

# 3. Logika Siklus (Jika sudah lewat Slot 3/index 2, kembalikan ke index 0)
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 3.. run scoreboard players set loadout_index practice.temp 0

# 4. Mainkan suara klik
execute unless entity @s[tag=editing_loadout] run playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1.2

# 5. --- UPDATE TEKS SIGN ---
# PENTING: Ganti X Y Z dengan koordinat Sign Pemilih Slot ini!
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 0 run data merge block 98 64 100 {Text3:'{"text":"[Slot 1]","color":"aqua","clickEvent":{"action":"run_command","value":"function practice:ui/cycle_loadout"}}'}
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 1 run data merge block 98 64 100 {Text3:'{"text":"[Slot 2]","color":"aqua","clickEvent":{"action":"run_command","value":"function practice:ui/cycle_loadout"}}'}
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 2 run data merge block 98 64 100 {Text3:'{"text":"[Slot 3]","color":"aqua","clickEvent":{"action":"run_command","value":"function practice:ui/cycle_loadout"}}'}

# 6. --- UPDATE PENANDA DI MEMORI NBT ---
execute unless entity @s[tag=editing_loadout] run data remove storage lpp:inventory loadouts[].selected

execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 0 run data modify storage lpp:inventory loadouts[0].selected set value 1b
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 1 run data modify storage lpp:inventory loadouts[1].selected set value 1b
execute unless entity @s[tag=editing_loadout] if score loadout_index practice.temp matches 2 run data modify storage lpp:inventory loadouts[2].selected set value 1b

# 7. Salin data slot yang aktif ke folder sementara "selected"
execute unless entity @s[tag=editing_loadout] run data modify storage lpp:inventory selected set from storage lpp:inventory loadouts[{selected:1b}]