if global.debug_mode
{
	//set draw
	draw_reset()
	draw_set_halign(fa_middle)
	
	//set strings
	var hspd_string,vspd_string,str
	var hspd_string=string_format(abs(hspd+hspd_frac),2,2)
	var vspd_string=string_format(abs(vspd+vspd_frac),2,2)
	
	if sign(hspd)==1 str="+" else str="-"
	hspd_string=str+hspd_string
	if sign(vspd)==1 str="+" else str="-"
	vspd_string=str+vspd_string
	
	//draw text
	draw_text(x,y-32,"HSPD: "+hspd_string)
	draw_text(x,y-42,"VSPD: "+vspd_string)
	draw_text(x,y-52,"STATE: "+string_format(state,2,2))
}

//draw where the orb will end up
var xx=x
var yy=y
var dir=point_direction(xx,yy,mouse_x,mouse_y)
mask_index=spr_orb
while (!place_meeting(xx,yy,obj_orbwall)) 
{
	xx+=lengthdir_x(1,dir)
	yy+=lengthdir_y(1,dir)
	if !point_in_rectangle(xx,yy,0,0,room_width,room_height)
	{
		break
	}
}

var color
if canOrb && !thrown_orb color=c_white else color=c_red
draw_sprite_ext(spr_orb,0,xx,yy,1,1,0,color,0.4)
mask_index=spr_player_idle