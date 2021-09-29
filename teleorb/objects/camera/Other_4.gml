//declare variables
cameraX=0;
cameraY=0;
shake_amount = 0
shake_dir = 0
target=obj_player;

setup_camera();

if instance_exists(target)
{
	//move to the target instance
	cameraX=target.x-(cameraWidth*0.5);
	cameraY=target.y-(cameraHeight*0.5);
}

//move to player
alarm[0]=1;