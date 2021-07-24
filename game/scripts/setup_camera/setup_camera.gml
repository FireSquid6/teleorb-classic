function setup_camera()
{
	//get display width and height
	displayWidth=display_get_width();
	displayHeight=display_get_height();

	//my game is in pixel art, so the display scale variable scales it up 2 times
	displayScale=0.5;

	//get camera width and height by dividing the display width and height by the display scale
	cameraWidth=displayWidth*displayScale;
	cameraHeight=displayHeight*displayScale;

	//set camera to a view
	view_enabled=true;
	view_visible[0]=true;
    
	//vport
    camera_set_view_size(view_camera[0],cameraWidth,cameraHeight);
    view_set_wport(view_camera[0],displayWidth);
    view_set_hport(view_camera[0],displayHeight);
    
	//display
	//do this for mac because mac is stupid and hates borderless windows
	if os_type==os_macosx
	{
		window_set_fullscreen(true);
	}

	//set the window and application surface to the display size
	window_set_size(displayWidth,displayHeight);
	surface_resize(application_surface,cameraWidth,cameraHeight);

	//set the gui to the display size. This is optional.
	//doing this allows me to use higher resolution images for gui sprites
	display_set_gui_size(displayWidth,displayHeight);
}