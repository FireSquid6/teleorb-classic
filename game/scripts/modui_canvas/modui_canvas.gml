function modui_canvas(_drawType) constructor
{
	//get initial variables and methods
	switch _drawType
	{
		case MODUI_DRAW_TYPES.NORMAL:
			get_mouse_x=function()
			{
				return mouse_x
			}
			get_mouse_y=function()
			{
				return mouse_y
			}
			break
		case MODUI_DRAW_TYPES.GUI:
			get_mouse_x=function()
			{
				return display_mouse_get_x()
			}
			get_mouse_y=function()
			{
				return display_mouse_get_y()
			}
			break
	}
	elements=[]
	
	//define static methods
	//element adding
	static add_element=function(_element,_gridx,_gridy)
	{
		//set mouse getting variables
		_element.get_mouse_x=get_mouse_x
		_element.get_mouse_y=get_mouse_y
		
		//add element to array
		array_insert(elements,0,_element)
	}
	
	//grid system for gamepads
	//make this later
	static add_grid=function()
	{
		grid_enabled=true
		
		selected_x=0
		selected_y=0
		
		selection_grid=ds_grid_create(MODUI_GRID_WIDTH,MODUI_GRID_HEIGHT)
	}
	
	static update_grid_pos=function(_x,_y) //run this before the update function if you want it to work
	{
		selected_x=_x
		selected_y=_y
	}
	
	//update function - run each frame in step event
	static update=function()
	{
		var cursor_x=get_mouse_x()
		var cursor_y=get_mouse_y()
		
		if keyboard_check(vk_space)
		{
			imposter="sus"
		}
		
		//loop through each element
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{
			//check if element is selected
			if point_in_rectangle(cursor_x,cursor_y,elements[i].bbox_left,
			elements[i].bbox_top,elements[i].bbox_right,elements[i].bbox_bottom)
			{
				elements[i].selected=true
				
			}
			
			//run update function
			elements[i].update()
		}
	}
	
	//draw function - run in draw/draw gui event respectively
	static draw=function()
	{
		//loop through elements and perform draw
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{
			elements[i].draw()
		}
	}
}