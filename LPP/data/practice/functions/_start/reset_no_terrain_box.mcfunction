# Muat empat segmen struktur 25x24x25 untuk mereset box 50x50 tanpa atap.
forceload add 975 975 1024 1024

setblock 975 219 975 minecraft:air replace
setblock 975 220 975 minecraft:structure_block{mode:"LOAD",name:"lavabuilder:no_terrain_box_00",posX:0,posY:0,posZ:0,ignoreEntities:1b} replace
setblock 975 219 975 minecraft:redstone_block replace
setblock 975 219 975 minecraft:air replace

setblock 1000 219 975 minecraft:air replace
setblock 1000 220 975 minecraft:structure_block{mode:"LOAD",name:"lavabuilder:no_terrain_box_10",posX:0,posY:0,posZ:0,ignoreEntities:1b} replace
setblock 1000 219 975 minecraft:redstone_block replace
setblock 1000 219 975 minecraft:air replace

setblock 975 219 1000 minecraft:air replace
setblock 975 220 1000 minecraft:structure_block{mode:"LOAD",name:"lavabuilder:no_terrain_box_01",posX:0,posY:0,posZ:0,ignoreEntities:1b} replace
setblock 975 219 1000 minecraft:redstone_block replace
setblock 975 219 1000 minecraft:air replace

setblock 1000 219 1000 minecraft:air replace
setblock 1000 220 1000 minecraft:structure_block{mode:"LOAD",name:"lavabuilder:no_terrain_box_11",posX:0,posY:0,posZ:0,ignoreEntities:1b} replace
setblock 1000 219 1000 minecraft:redstone_block replace
setblock 1000 219 1000 minecraft:air replace
