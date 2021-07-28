function move_self()
{
	//horizontal collision
	if place_meeting(x+hspd,y,obj_wall)
	{
		var i=sign(hspd)
		while !place_meeting(x+i,y,obj_wall) {x+=i}
		hspd=0
	}
	
	//move x
	x+=floor(hspd)
	x=floor(x)

	//collision check y
	if place_meeting(x,y+vspd,obj_wall)
	{
		var i=sign(vspd)
		while !place_meeting(x,y+i,obj_wall) {y+=i}
		vspd=0
	}

	//move y
	if global.gravityDir=1 y+=floor(vspd) else y+=ceil(vspd)
}