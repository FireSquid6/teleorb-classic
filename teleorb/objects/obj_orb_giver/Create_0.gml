enum GIZMO_STATES
{
	ALIVE,
	DYING,
	DEAD
}
#macro GIZMO_FADEOUT_SPEED 0.1
#macro GIZMO_DEAD_TIME 300
time = 0
state=GIZMO_STATES.ALIVE
onCollision=function()
{
	obj_player.canOrb=true
}