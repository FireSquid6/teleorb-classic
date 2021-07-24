//SCRIPT CREDIT GOES TO @Zen00 ON THE GM SERVER

///@func collision_line_tile(x1, y1, x2, y2, tile_layer_id)
///@desc Returns true if there is a tile collision between the 1 and 2 points (of any tile type that is not id 0), must be integer line points
///@param {int} x1
///@param {int} y1
///@param {int} x2
///@param {int} y2
///@param {int} tile_layer_id
function collision_line_tile(x1, y1, x2, y2, _id) 
{
	x1=floor(x1)
	y1=floor(y1)
	x2=floor(x2)
	y2=floor(y2)

	var dx = abs(x2 - x1); //Line length in the x
	var sx = (x1 < x2) ? 1 : -1; //How much to step in the x/y direction for the next check
	var dy = -abs(y2 - y1);
	var sy = (y1 < y2) ? 1 : -1;
	var err = dx + dy; //Total line length
	
	while(true) {
		var err2 = 2 * err; //Sort of a accuracy multiplier
		if(err2 >= dy) {
			err += dy;
			x1 += sx;
		}
		if(err2 <= dx) {
			err += dx;
			y1 += sy;
		}
		
		//Could throw in a "tile id" variable for testing for specific tile type collisions
		var _tile = tile_get_index(tilemap_get_at_pixel(_id, x1, y1));
		if(_tile == 1) { return true; }
		if((x1 == x2) && (y1 == y2)) { return false; } //Just make sure this happens one way or another otherwise you'll have a freeze, this is part of why it requires ints
	}
}