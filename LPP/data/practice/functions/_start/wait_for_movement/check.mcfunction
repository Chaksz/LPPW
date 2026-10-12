# check.mcfunction
function practice:_start/movement_detection/check

# Jika bergerak -> picu mulai timer & survival
execute if score $moved playerpos matches 1 run function practice:_start/wait_for_movement/trigger

# Jika belum bergerak -> tampilkan actionbar dan jadwalkan cek tick berikutnya
execute unless score $moved playerpos matches 1 run title @a actionbar {"text":"Waiting for movement...","italic":true,"color":"yellow"}
execute unless score $moved playerpos matches 1 run schedule function practice:_start/wait_for_movement/wait 1t replace

