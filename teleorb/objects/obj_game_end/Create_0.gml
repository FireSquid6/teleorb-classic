text = scribble("TO BE CONTINUED...")
text.starting_format("fnt_lcd",c_white)
text.transform(8,8,0)
text.align(fa_center,fa_middle)

//ui
//canvas
canvas = new modui_canvas()

//delete
var xx=display_get_width()-((sprite_get_width(spr_trashCan)*guiscale)+padding)
var yy=display_get_gui_height() - ((sprite_get_height(spr_trashCan)*guiscale)+padding)
element=new modui_button_sprite(spr_trashCan,0,xx,yy)
with element
{
	image_xscale=guiscale
	image_yscale=guiscale
	snap_bbox_to_scale()
	normal_index=0
	selected_index=1
	pressed_index=2
	add_method(change_image_index,MODUI_EVENTS.UPDATE)
	add_method(reset_game,MODUI_EVENTS.PRESSED)
	add_method(play_click,MODUI_EVENTS.PRESSED)
}
canvas.add_element(element)