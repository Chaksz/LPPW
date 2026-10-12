# wait.mcfunction
execute if score waiting_for_movement practice.temp matches 1 if score running practice.temp matches 1 run function practice:_start/wait_for_movement/check

