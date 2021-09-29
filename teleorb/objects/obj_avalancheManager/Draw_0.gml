draw_reset()

if global.debug_mode
{
	if active draw_set_color(c_red) else draw_set_color(c_white)
	draw_line_width(x, 0, x, room_height,1)
}