if keyboard_check_pressed(ord("R")) game_restart()
if keyboard_check(vk_lcontrol) room_speed=2 else room_speed=60
if keyboard_check_pressed(vk_escape) game_end()

