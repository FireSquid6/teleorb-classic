orbSpd=12
angle=0

#macro ORB_SNAP_DISTANCE

//get hspd and vspd
var orbDir=point_direction(x,y,mouse_x,mouse_y)
hspd=lengthdir_x(orbSpd,orbDir)
vspd=lengthdir_y(orbSpd,orbDir)