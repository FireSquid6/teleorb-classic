//requires you to set the following variables with the modui element
//scribble_element - the scribble data stuff
//scrib_x - draw x position
//scrib_y - draw y position

function draw_scribble_end_draw()
{
	if keyboard_check(vk_space)
	{
		imposter="sus"
	}
	if selected 
	{
		draw_sprite(sprite_index,1,x,y)
	}
	if variable_struct_exists(self,"scribble_element")
	{
		scribble_element.draw(scrib_x,scrib_y)
	}
}