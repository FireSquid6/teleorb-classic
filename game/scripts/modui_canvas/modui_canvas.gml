function modui_canvas() constructor
{
	//get initial variables and methods
	elements=[]
	selectedPosition=0
	pressedPosition=0
	cursor_x=0
	cursor_y=0
	pressed=0
	
	//define static methods
	//element adding
	static add_element=function(_element)
	{
		//add element to array
		array_insert(elements,0,_element)
		
		//update element
		update_element(0)
		
		//run function
		elements[0].init()
	}
	
	static update_element=function(_pos)
	{
		elements[_pos].canvasRef=self
		elements[_pos].position=_pos
	}
	
	//update function - run each frame in step event
	static update=function(_cursorx,_cursory,_clicked)
	{
		cursor_x=_cursorx
		cursor_y=_cursory
		pressed=_clicked
		
		//check if change selection
		var changeSelection=elements[selectedPosition].selected
		var changePressed=elements[pressedPosition].pressed
		var doChange=!(changeSelection && changePressed)
		
		//loop through each element
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{	
			//give the element self
			update_element(i)
			
			//check if element is selected
			if doChange
			{
				//check if selected
				var bboxl=elements[i].bbox_left
				var bboxr=elements[i].bbox_right
				var bboxt=elements[i].bbox_top
				var bboxb=elements[i].bbox_bottom
				
				if point_in_rectangle(cursor_x,cursor_y,bboxl,bboxt,bboxr,bboxb)
				{
					elements[i].selected=true
					elements[i].selectedPosition=i
					if pressed
					{
						elements[i].pressed=true
						pressedPosition=i
					}
				}
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
			
			if global.modui_debug
			{
				var bboxl=elements[i].bbox_left
				var bboxr=elements[i].bbox_right
				var bboxt=elements[i].bbox_top
				var bboxb=elements[i].bbox_bottom
				draw_set_color(c_aqua)
				draw_rectangle(bboxl,bboxt,bboxr,bboxb,true)
				draw_set_color(c_white)
			}
		}
		
		//draw debug
		if global.modui_debug
		{
			draw_set_color(c_aqua)
			
			//draw cursor
			draw_circle(cursor_x,cursor_y,4,false)
			
			//draw bbox
			var length=array_length(elements)
			for (var i=0; i<length; i++)
			{
				var bboxl=elements[i].bbox_left
				var bboxr=elements[i].bbox_right
				var bboxt=elements[i].bbox_top
				var bboxb=elements[i].bbox_bottom
				draw_rectangle(bboxl,bboxt,bboxr,bboxb,true)
			}
			
			draw_set_color(c_white)
		}
	}
	
	static destroy=function()
	{
		//loop through elements and perform destroy
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{
			elements[i].destroy()
		}
	}
}