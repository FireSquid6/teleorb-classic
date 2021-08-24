if instance_exists(target)
{
	//this code does extra stuff that sets linear interpolation to move the camera
	//between the mouse and the player depending on if the left shift key is pressed
	//im not entirely sure how it works
	//var key_look=keyboard_check(vk_lshift);
	var lp=0.4;
	
	//move to the target instance
	cameraX=target.x-(cameraWidth*0.5);
	cameraY=target.y-(cameraHeight*0.5);
	
	//move to mouse
	cameraX=lerp(target.x,mouse_x,lp)-(cameraWidth*0.5);
	cameraY=lerp(target.y,mouse_y,lp)-(cameraHeight*0.5);
	
	//stop the camera from showing stuff outside of the room
	cameraX=clamp(cameraX,0,room_width-cameraWidth);
	cameraY=clamp(cameraY,0,room_height-cameraHeight);
}

//set the cameras position to the new x and y position
camera_set_view_pos(view_camera[0],cameraX,cameraY);