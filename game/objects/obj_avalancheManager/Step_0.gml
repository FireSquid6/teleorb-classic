if active
{
	var list=ds_list_create()
	collision_line_list(x,0,x,room_height,obj_rock,true,false,list,false)
	
	var _size=ds_list_size(list)
	var i = 0
	while i<_size
	{
		var _id=ds_list_find_value(list,i)
		if instance_exists(_id)
		{
			with _id
			{
				states.change("active")
			}
		}
		
		i++
	}
	
	var spd = AVALANCHE_MANAGER_MIN_SPD
	
	if point_distance(x,y,obj_player.x,obj_player.y) > 128 spd=AVALANCHE_MANAGER_MAX_SPD
	
	//move
	x+=spd
}
else
{
	if place_meeting(x, y, obj_player) || place_meeting(x,y,obj_orb) active = true
}