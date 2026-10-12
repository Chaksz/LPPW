# requeue_validation.mcfunction
# INI yang dipanggil oleh /schedule (TANPA konteks player/posisi apapun).
# Makanya kita re-select player yang lagi nunggu lewat tag "awaiting_respread",
# baru pasang ulang konteks "as ... at ..." sebelum lempar ulang & cek ulang.
execute as @a[tag=awaiting_respread] at @s run function practice:_start/_respread_and_recheck
