orbSpd=8

//get hspd and vspd
var orbDir=point_direction(x,y,mouse_x,mouse_y)
hspd=x-lengthdir_x(orbSpd,orbDir)
vspd=y-lengthdir_y(orbSpd,orbDir)