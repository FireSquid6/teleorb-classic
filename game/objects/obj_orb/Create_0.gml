orbSpd=12

//get hspd and vspd
var orbDir=point_direction(x,y,mouse_x,mouse_y)
hspd=dcos(orbDir)*orbSpd
vspd=dsin(orbDir)*orbSpd*-1