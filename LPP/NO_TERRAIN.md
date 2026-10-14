# No-terrain practice setup

The mode selector sign is placed manually at `102 65 100`. After placing a
sign at that exact block, run `/function practice:ui/setup_practice_mode_sign`
once. Clicking its mode line cycles between Terrain and No-terrain; the choice
is stored per player. Terrain is the default. The sign displays only
`[Terrain]` in dark green or `[No Terrain]` in aqua; clicking it does not send
mode messages to chat.

No-terrain uses an open-top arena with bounds `975 220 975` through
`1024 243 1024`. Since Minecraft 1.16 structure templates are limited to 32
blocks per axis, the reset box is generated as four 25x24x25 structure NBT
sections. Together, the sections restore the black-concrete side walls, a
full 50x50 platform five blocks thick (`Y=226–230`), and explicit air
throughout the remaining interior before every start or rerun. The box has no roof. The
generated lava-pool structure contains air palette blocks, which overwrite
the platform within the pool footprint.

The no-terrain player is teleported to `1001.29 231.00 1008.76`, facing yaw
`182.94`. The pool center is placed five horizontal blocks in front of the
player; the existing random pool generator selects its shape and rotation.
The terrain generator and its placement logic are unchanged.
