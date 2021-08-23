//requires you to set the following variables with the modui element
//scribble_element - the scribble data stuff
//scrib_x - draw x position
//scrib_y - draw y position

function draw_scribble_end_draw()
{
	if wasselected 
	{
		draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	}
	if variable_struct_exists(self,"scribble_element")
	{
		scribble_element.draw(scrib_x,scrib_y)
	}
}

function store_selected()
{
	wasselected=selected
}