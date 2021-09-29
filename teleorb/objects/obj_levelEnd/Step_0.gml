if place_meeting(x,y,obj_player)
{
	//save time and stuff
	var save_time=false
	with game
	{
		if hasBestTime
		{
			if minutes<best_minutes 
			{
				save_time=true
			}
			else if minutes==best_minutes && seconds<best_seconds
			{
				save_time=true
			}
			else if minutes==best_minutes && seconds==best_seconds && frames<best_frames
			{
				save_time=true
			}
	
			if save_time
			{
				var struct =
				{
					minutes : minutes,
					seconds : seconds,
					frames : frames
				}
				var str=json_stringify(struct)
				var buff=buffer_create(1,buffer_grow,1)
				buffer_write(buff,buffer_string,str)
				buffer_save(buff,"besttime.savedgame")
			}
		}
		else
		{
			var struct =
			{
				minutes : minutes,
				seconds : seconds,
				frames : frames
			}
			var str=json_stringify(struct)
			buff=buffer_create(1,buffer_grow,1)
			buffer_write(buff,buffer_string,str)
			buffer_save(buff,"besttime.savedgame")
		}
	}
	
	//move to room
	room = rm_game_end
}