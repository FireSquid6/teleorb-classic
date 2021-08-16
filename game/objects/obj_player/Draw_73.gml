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
var dir=point_direction(x,y,mouse_x,mouse_y)
while (!collision_point(xx,yy,obj_wall,true,false)) || (xx<0 || xx>room_width) || (yy<0 || yy>room_height)
{
	xx+=lengthdir_x(1,dir)
	yy+=lengthdir_y(1,dir)	
}

if canOrb draw_set_color(c_green) else draw_set_color(c_red)
draw_set_alpha(0.4)
draw_circle(xx,yy,4,false)