orbSpd=12
angle=0

//set points
var half_width = (bbox_right - bbox_left) div 2
var half_height = (bbox_bottom - bbox_top) div 2

point_top = new vec2(bbox_left + half_width, bbox_top)
point_left = new vec2(bbox_left, bbox_top + half_height)
point_right = new vec2(bbox_right, bbox_top + half_height)
point_bottom = new vec2(bbox_left + half_width, bbox_bottom)

#macro ORB_SNAP_DISTANCE 8
#macro CHECK_POINTS (collision_point(point_top.x, point_top.y, obj_orbwall, false, true) || collision_point(point_left.x, point_left.y, obj_orbwall, false, true) || collision_point(point_right.x, point_right.y, obj_orbwall, false, true) || collision_point(point_bottom.x, point_bottom.y, obj_orbwall, false, true))

//get hspd and vspd
var orbDir=point_direction(x,y,mouse_x,mouse_y)
hspd=lengthdir_x(orbSpd,orbDir)
vspd=lengthdir_y(orbSpd,orbDir)

function vec2(_x, _y) constructor
{
	x = _x
	y = _y
}