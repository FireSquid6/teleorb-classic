function teleorb_ui_button_template(_x,_y_,_sprite,_subimage) : modui_button_sprite(_x,_y_,_sprite,_subimage) constructor
{
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
	normal_index=0
	selected_index=1
	pressed_index=2
	add_method(change_image_index,MODUI_EVENTS.UPDATE)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}