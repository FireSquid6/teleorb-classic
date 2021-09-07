states = new SnowState("waiting",false)
states.add("waiting", {
	
})
states.add("active", {
	enter : function()
	{
		outOfWall = false
	}
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
		
		if place_meeting(x,y,obj_player)
		{
			with obj_player
			{
				moveto_die()
			}
		}
	}
})
states.add("hit", {
	enter : function()
	{
		y --
		
		//create particles and stuff
	}
})