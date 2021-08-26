var s,bbox_x,bbox_y,bbox_x_name,bbox_y_name,movex,movey,hcol_moved,vcol_moved

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)

angle+=3*sign(hspd)

//figure out if there is a collision
if hcol || vcol
{	
	//move to wall
	if hcol
	{
		//move to wall
		x=floor(x)
		y=floor(y)
		s=sign(hspd)
		while !place_meeting(x+s,y,obj_orbwall) {x+=s}
		hcol_moved=true
	}
	else
	{
		if collision_line(x,y,bbox_right+ORB_SNAP_DISTANCE,y,obj_orbwall,false,true)
		{
			while !place_meeting(x,y,obj_orbwall) {x+=movex}
			hcol_moved=true
			movex=1
		}
	}
	
	//set collision variables
	if hcol_moved
	{
		movex=s
		if movex==1
		{
			bbox_x=bbox_right
			bbox_x_name="bbox_right"
		}
		else
		{
			bbox_x=bbox_left
			bbox_x_name="bbox_right"
		}
	}
	
	if vcol
	{
		y=floor(y)
		x=floor(x)
		s=sign(vspd)
		while !place_meeting(x,y+s,obj_orbwall) {y+=s}
	}
	
	//move the player
	with obj_player
	{
		//play sound
		audio_play_sound(sfx_orb_hit,50,false)
		
		//if the player is traveling downwards, set vspd to 0
		//This is to make speed conversion feel right
		if vspd>0 vspd=0
		
		//add speeds
		hspd+=other.hspd*0.5
		vspd+=other.vspd*0.5
		
		//move the player
		moveto_teleport()
		x=other.x
		y=other.y
		
		var xreps=0
		var yreps=0
		
		//move player bbox to orb bbox
		var mybbox=variable_instance_get(id,bbox_x_name)
		while mybbox!=bbox_x
		{
			x-=movex
			mybbox=variable_instance_get(id,bbox_x_name)
			xreps++
		}
		
		mybbox=variable_instance_get(id,bbox_y_name)
		while mybbox!=bbox_y
		{
			y-=movey
			mybbox=variable_instance_get(id,bbox_y_name)
			yreps++
		}
		
		//if the player is still in a wall, cry about it
		if place_meeting(x,y,obj_wall)
		{
			show_debug_message("******************************** KILL ME NOW ******************************")
			
			show_debug_message("bbox_left: "+string(bbox_left))
			show_debug_message("bbox_right: "+string(bbox_right))
			show_debug_message("bbox_top: "+string(bbox_top))
			show_debug_message("bbox_bottom: "+string(bbox_bottom))
			show_debug_message("bbox_x_name: "+string(bbox_x_name))
			show_debug_message("bbox_y_name: "+string(bbox_y_name))
			show_debug_message("movex: "+string(movex))
			show_debug_message("movey: "+string(movey))
			show_debug_message("bbox_x: "+string(bbox_x))
			show_debug_message("bbox_y: "+string(bbox_y))
			show_debug_message("hcol: "+string(hcol))
			show_debug_message("vcol: "+string(vcol))
			show_debug_message("xreps: "+string(xreps))
			show_debug_message("yreps: "+string(yreps))
			show_debug_message("hspd: "+string(other.hspd))
			show_debug_message("vspd: "+string(other.vspd))
		}
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd