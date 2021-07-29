function move_self()
{
	//set mask
	mask_index=spr_player_idle
	
	//add fractions
	hspd+=hspd_frac
	vspd+=vspd_frac
	
	//store fractions
	hspd_frac = hspd - (floor(abs(hspd)) * sign(hspd))
	vspd_frac = vspd - (floor(abs(vspd)) * sign(vspd))
	
	//subtract fractions
	hspd-=hspd_frac
	vspd-=vspd_frac
	
	//horizontal collision
	if place_meeting(x+hspd,y,obj_wall)
	{
		var i=sign(hspd)
		while !place_meeting(x+i,y,obj_wall) 
		{
			x+=i
		}
		hspd=0
	}
	
	//move x
	x+=hspd

	//collision check y
	if place_meeting(x,y+vspd,obj_wall)
	{
		var i=sign(vspd)
		while !place_meeting(x,y+i,obj_wall) {y+=i}
		vspd=0
	}

	//move y
	y+=vspd
}