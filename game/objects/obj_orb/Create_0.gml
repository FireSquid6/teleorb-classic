orbSpd=12

//get hspd and vspd
var orbDir=point_direction(x,y,mouse_x,mouse_y)
var nothspd=lengthdir_x(orbSpd,orbDir)
var notvspd=lengthdir_y(orbSpd,orbDir)
hspd=dcos(orbDir)*orbSpd
vspd=dsin(orbDir)*orbSpd*-1

if (nothspd!=hspd) || (notvspd!=vspd)
{
	imposter="sus"
}