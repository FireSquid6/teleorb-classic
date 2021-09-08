states = new SnowState("waiting",false)
states.add("waiting", {
	
})
states.add("active", {
	enter : function()
	{
		outOfWall = false
	},
	step : function() 
	{
		y += ROCK_SPD
		
		if outOfWall
		{
			if place_meeting(x ,y, obj_wall) states.change("hit")
		}
		else
		{
			if !place_meeting(x, y, obj_wall) outOfWall = true
		}
	}
})
states.add("hit", {
	enter : function()
	{
		y --
		
		//play sound
		audio_play_sound(sfx_rock_hit,50,false)
	}
})