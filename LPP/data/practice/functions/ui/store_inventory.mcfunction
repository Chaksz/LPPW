data modify storage lpp:inventory selected.inventory append from storage lpp:inventory selected.inventory_all[-1]
execute store result storage lpp:inventory selected.inventory[-1].Slot byte 1 run scoreboard players remove slot_num practice.temp 9
scoreboard players add slot_num practice.temp 9