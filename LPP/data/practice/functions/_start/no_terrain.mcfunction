# Reset box tetap, lalu letakkan marker arena pada anchor no-terrain.
schedule clear practice:_start/validate_location
schedule clear practice:_start/wait_for_marker
tag @s remove awaiting_respread
function practice:_start/reset_no_terrain_box
function practice:_start/post_load_no_terrain