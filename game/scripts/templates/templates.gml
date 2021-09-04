function teleorb_ui_button_template(_sprite,_subimage,_x,_y,_text) : modui_button_sprite(_sprite,_subimage,_x,_y) constructor
{
	scribble_element=scribble(_text)
	scribble_element=format_box_scribble(scribble_element)
	image_xscale=box_scale
	image_yscale=box_scale
	scrib_x=x+(sprite_get_width(sprite_index)*0.5)*image_xscale
	scrib_y=y+(sprite_get_height(sprite_index)*0.5)*image_yscale
	snap_bbox_to_scale()
	add_method(draw_scribble_end_draw,MODUI_EVENTS.POSTDRAW)
	add_method(store_selected,MODUI_EVENTS.UPDATE)
	add_method(play_click,MODUI_EVENTS.PRESSED)
	normal_index=0
	selected_index=0
	pressed_index=0
	
	add_method(change_image_index,MODUI_EVENTS.UPDATE)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}

function format_box_scribble(_element)
{
	_element.starting_format("fnt_lcd",c_black)
	_element.align(fa_center,fa_middle)
	_element.transform(1.75,1.75,0)
	return _element
}

function format_box(_element)
{
	with _element
	{
		image_xscale=box_scale
		image_yscale=box_scale
		scrib_x=x+(sprite_get_width(sprite_index)*0.5)*image_xscale
		scrib_y=y+(sprite_get_height(sprite_index)*0.5)*image_yscale
		snap_bbox_to_scale()
		add_method(draw_scribble_end_draw,MODUI_EVENTS.POSTDRAW)
		add_method(store_selected,MODUI_EVENTS.UPDATE)
		add_method(play_click,MODUI_EVENTS.PRESSED)
	}
	return _element
}
