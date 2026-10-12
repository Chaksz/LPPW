# 1. Ubah teks Sign menjadi [Save] berwarna hijau
# PENTING: Ganti X Y Z dengan koordinat persis tempat Sign-mu berada di Hub!
data merge block 98 65 100 {Text3:'{"text":"[Save]","color":"green","clickEvent":{"action":"run_command","value":"function practice:ui/save_loadout"}}'}

# 2. Ubah pemain ke mode Creative
gamemode creative @s

# 3. MUAT ULANG LOADOUT YANG TERSIMPAN (Ini yang sebelumnya kurang!)
function practice:ui/loadinv

# 3. Mainkan suara "klik" sebagai feedback UI
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1

# 4. Beri tag bahwa pemain sedang dalam mode edit (berguna untuk memblokir timer/sesi latihan)
tag @s add editing_loadout