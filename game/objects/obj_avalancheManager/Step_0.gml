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
				active = true
			}
		}
		else
		{
			imposter="sus"
		}
		
		i++
	}
	
	//move
	x+=AVALANCHE_MANAGER_SPD
}
else
{
	if place_meeting(x, y, obj_player) states.change("active")
}