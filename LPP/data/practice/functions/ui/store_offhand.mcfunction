data modify storage lpp:inventory selected.offhand append from storage lpp:inventory selected.inventory_all[-1]
execute store result storage lpp:inventory selected.offhand[-1].Slot byte 1 run scoreboard players add slot_num practice.temp 106
scoreboard players remove slot_num practice.temp 106