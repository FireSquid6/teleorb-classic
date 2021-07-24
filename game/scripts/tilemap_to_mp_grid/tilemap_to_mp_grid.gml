function tilemap_to_mp_grid(tilemap,grid,width,height,size)
{
	//	use:
	//	This function converts a tilemap to an mp_grid. It marks any cell with a tile in it
	//	as forbidden. For this to work, both the tilemap and the mp_grid need to have the same
	//	tile size and cell size respectively. It will be funky if it doesn't.
	//
	//	variable info:
	//	tilemap - tilemap returned by layer_tilemap_get_id([layer_name])
	//	grid - mp_grid returned by mp_grid_create()
	//	width - width in pixels of the grid
	//	height - width in pixels of the grid
	//	size - size of a cell on the mp_grid
	
	//get width and height in cells
	var cwidth=(width div size)
	var cheight=(height div size)
	
	//setup local variables
	var row=0 //the current row the loop is checking for a tile
	var column=0 //the current column the loop is checking for a tile
	var xx,yy //x and y pixel position the loop checks for

	//loop
	while (row!=cheight)
	{
		//check column is over the width in cells
		if column>=cwidth
		{
			row++ //start checking the next row
			column=0 //reset column
		}
	
		//get x and y in pixels
		xx=column*size
		yy=row*size
		
		//check tilemap
		if tilemap_get_at_pixel(tilemap,xx,yy)!=0
		{
			mp_grid_add_cell(grid,column,row) //if tile is found, mark cell as forbidden
		}
	
		//add to column
		column++
	}
}