# portal_success.mcfunction
# Gerbang eksekusi penyelesaian portal.
# Hanya memanggil _portal_finish jika sesi latihan masih aktif (running=1).
# Hal ini mencegah hasil chat/suara/title muncul lebih dari 1 kali dalam 1 tick.

execute if score running practice.temp matches 1 run function practice:_portal_finish
