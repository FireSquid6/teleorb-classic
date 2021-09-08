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
		
		//create particles and stuff
		repeat 50
		{
			var p = global.pt_rockHit
			part_type_direction(p,30,150,0,0.2)
			part_particles_create(p, x, y, p, 12)
		}
		
		//play sound
		audio_play_sound(sfx_rock_hit,50,false)
	}
})