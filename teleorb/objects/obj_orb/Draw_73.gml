if DEVELOPER_MODE && global.debug_mode
{
	//set draw
	draw_reset()
	draw_set_halign(fa_middle)
	
	//draw text
	draw_text(x,y-32,"HSPD: "+string(hspd))
	draw_text(x,y-42,"VSPD: "+string(vspd))
}