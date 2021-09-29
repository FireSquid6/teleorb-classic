#region PARENT
function modui_element_parent() constructor
{
	//other vars
	selected=false //changes whether the element is selected or not
	lastSelected=false //self explanitory
	pressed=false //changes whether the element is pressed or not
	lastPressed=false //self explanitory
	canvasRef=-1 //contains the index of the canvas struct
	
	//function lists
	//don't touch these
	//use the add_method function instead
	init_list=ds_list_create() //runs on element initiation
	destroy_list=ds_list_create() //runs when element is destroyed
	update_list=ds_list_create() //runs whenever the update methods is called
	selected_list=ds_list_create() //runs after the update methods if selected
	pressed_list=ds_list_create() //runs after the selected methods is pressed
	predraw_list=ds_list_create() //runs before the element draws itself
	postdraw_list=ds_list_create() //runs after the element draws itself
	
	//MODIFYING METHODS
	//deletes all methods
	static clear_methods=function()
	{
		init_list=ds_list_create()
		destroy_list=ds_list_create()
		update_list=ds_list_create()
		selected_list=ds_list_create()
		pressed_list=ds_list_create()
		predraw_list=ds_list_create()
		postdraw_list=ds_list_create()
		return self
	}
	
	//adds a method
	static add_method=function(_method,_event)
	{
		switch _event
		{
			case MODUI_EVENTS.UPDATE:
				ds_list_add(update_list,_method)
				break
			case MODUI_EVENTS.PRESSED:
				ds_list_add(pressed_list,_method)
				break
			case MODUI_EVENTS.SELECTED:
				ds_list_add(selected_list,_method)
				break
			case MODUI_EVENTS.POSTDRAW:
				ds_list_add(postdraw_list,_method)
				break
			case MODUI_EVENTS.PREDRAW:
				ds_list_add(predraw_list,_method)
				break
			case MODUI_EVENTS.DESTROY:
				ds_list_add(destroy_list,_method)
				break
			case MODUI_EVENTS.INIT:
				ds_list_add(init_list,_method)
				break
		}
		return self
	}
	
	//removes the element from the canvas
	static remove_self=function()
	{
		array_delete(canvasRef.elements,position,1)
		destroy()
	}
	
	//draw self
	static draw=function()
	{
		//loop through function list
		loop_through_function_list(predraw_list)
		
		//draw self
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		
		//loop through other funciton list
		loop_through_function_list(postdraw_list)
		return self
	}
	
	static init=function()
	{
		loop_through_function_list(init_list)
	}
	
	static destroy=function()
	{
		loop_through_function_list(destroy_list)
	}
}
#endregion

#region BUTTON
function modui_button_sprite(_sprite,_subimage,_x,_y) : modui_element_parent() constructor
{
	//default transform and display vars
	sprite_index=_sprite 
	image_index=_subimage  
	image_angle=0 
	image_alpha=1
	image_blend=c_white
	image_xscale=1 
	image_yscale=1
	x=_x
	y=_y
	
	//controls if the element will reset it's selected and pressed variables after each update function
	//useful for DND elements
	resetSelf=true
	
	//these will be edited with the transform funciton or with the change_bbox function
	bbox_left=x
	bbox_top=y
	bbox_right=x+sprite_get_width(sprite_index)*image_xscale
	bbox_bottom=y+sprite_get_height(sprite_index)*image_yscale
	
	static change_bbox=function(_left,_top,_right,_bottom)
	{
		bbox_left=_left
		bbox_right=_right
		bbox_top=_top
		bbox_bottom=_bottom
		return self
	}
	
	static snap_bbox_to_scale=function()
	{
		change_bbox(x,y,x+((sprite_get_width(sprite_index)*image_xscale)-1),y+((sprite_get_height(sprite_index)*image_yscale)-1))
		return self
	}
	
	static transform=function(_x,_y,_xscale,_yscale)
	{
		x=_x
		y=_y
		image_xscale=_xscale
		image_yscale=_yscale
		
		bbox_left=x
		bbox_top=y
		bbox_right=x+sprite_get_width(sprite_index)*image_xscale
		bbox_bottom=y+sprite_get_height(sprite_index)*image_yscale
		return self
	}
	
	//EVENTS
	static update=function()
	{	
		//update functions
		loop_through_function_list(update_list)
		
		//run through selected and pressed methods
		if selected
		{
			loop_through_function_list(selected_list)
			
			//run through pressed methods
			if pressed loop_through_function_list(pressed_list)
		}
		
		//remove vars if resetSelf is true
		if resetSelf=true
		{
			selected=false
			pressed=false
		}
		
		return self
	}
}

function modui_button_text(_scribble_element) constructor
{
	
}

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

function loop_through_function_list(_list)
{
	//break
	if ds_list_size(_list)<1 return 0
	
	//loop
	var size=ds_list_size(_list)
	var i=0
	repeat size
	{
		size=ds_list_size(_list)
		var func=ds_list_find_value(_list,i)
		with self
		{
			func()
		}
		i++
	}
	
	//return
	return true
}

#endregion