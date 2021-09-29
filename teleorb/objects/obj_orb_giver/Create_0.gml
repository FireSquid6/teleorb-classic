enum GIZMO_STATES
{
	ALIVE,
	DEAD
}
#macro GIZMO_FADEOUT_SPEED 0.1
state=GIZMO_STATES.ALIVE
onCollision=function()
{
	obj_player.canOrb=true
}