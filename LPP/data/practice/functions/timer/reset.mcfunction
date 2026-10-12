# timer/reset.mcfunction
scoreboard players set ticks practice.timer 0
scoreboard players set seconds practice.timer 0
scoreboard players set minutes practice.timer 0
scoreboard players set sub_sec practice.timer 0

data modify storage practice:timer seconds set value [0, 0]
data modify storage practice:timer sub_seconds set value [0, 0]

