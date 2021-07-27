enum MODUI_DRAW_TYPES
{
	NORMAL,
	GUI
}

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
	static add_element=function(_element)
	{
		//set mouse getting variables
		_element.get_mouse_x=get_mouse_x
		_element.get_mouse_y=get_mouse_y
		array_insert(elements,0,_element)
	}
	
	//grid system for gamepads
	static add_grid=function()
	{
		
	}
	
	//update function - run each frame in step event
	static update=function()
	{
		//figure out which element is selected
		
		//loop through each element's update function
		for (var i=0; i<length; i++)
		{
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