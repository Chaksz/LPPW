# get_current_pos.mcfunction
# Salin posisi pemain ke storage
data modify storage practice:playerpos Pos set from entity @s Pos

# Ekstrak X dan Z dengan resolusi 1000 untuk deteksi pergerakan presisi
execute store result score $current.x playerpos run data get storage practice:playerpos Pos[0] 1000
execute store result score $current.z playerpos run data get storage practice:playerpos Pos[2] 1000

