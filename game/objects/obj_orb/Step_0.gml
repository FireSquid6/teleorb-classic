var foundcol=false
var bbox_y,bbox_x,xmove,ymove,s,bbox_x_name,bbox_y_name

var hcol=place_meeting(x+hspd,y,obj_orbwall)
var vcol=place_meeting(x,y+vspd,obj_orbwall)

//figure out if there is a collision
if hcol || vcol
{	
	//move
	if hcol
	{
		s=sign(hspd)
		while !place_meeting(x+s,y,obj_orbwall) {x+=s}
	}
	
	if vcol
	{
		s=sign(vspd)
		while !place_meeting(x,y+s,obj_orbwall) {y+=s}
	}
	
	//set to collision found
	foundcol=true
}
if foundcol
{
	with obj_player
	{
		//move player
		audio_play_sound(sfx_orb_hit,50,false)
		hspd+=other.hspd*0.5
		vspd+=other.vspd*0.5
		moveto_teleport()
		x=other.x
		y=other.y
		
		//figure out which bboxes are in collision
		if hcol
		{
			if collision_line(bbox_left,bbox_top,bbox_left,bbox_bottom,obj_orbwall,false,true)
			{
				bbox_x_name="bbox_left"
				xmove=1
			}
			else
			{
				bbox_x_name="bbox_right"
				xmove=-1
			}
		}
		if vcol
		{
			if collision_line(bbox_left,bbox_top,bbox_right,bbox_top,obj_orbwall,false,true)
			{
				bbox_y_name="bbox_top"
				ymove=1
			}
			else
			{
				bbox_y_name="bbox_bottom"
				ymove=-1
			}
		}
	
		//move player out of wall
		while place_meeting(x,y,obj_orbwall)
		{
			if hcol bbox_x=variable_instance_get(id,bbox_x_name)
			if vcol bbox_y=variable_instance_get(id,bbox_y_name)
			
			if hcol && collision_line(bbox_x,bbox_top,bbox_x,bbox_bottom,obj_orbwall,false,true)
			{
				x+=xmove
			}
			
			if vcol && collision_line(bbox_right,bbox_y,bbox_left,bbox_y,obj_orbwall,false,true)
			{
				y+=ymove
			}
		}
	}
	
	//kill self
	instance_destroy()
}

//move self
x+=hspd
y+=vspd