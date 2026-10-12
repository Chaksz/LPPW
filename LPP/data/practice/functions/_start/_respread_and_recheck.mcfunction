# _respread_and_recheck.mcfunction
# Dijalankan "as @a[tag=awaiting_respread] at @s" oleh requeue_validation.mcfunction,
# jadi @s di sini SUDAH BENAR mengacu ke player yang bersangkutan.
tag @s remove awaiting_respread
spreadplayers 0 0 100 5000 false @s
execute at @s run function practice:_start/validate_location
