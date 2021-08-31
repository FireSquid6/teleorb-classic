enum playerStates
{
	moving,
	jumping,
	falling,
	wallriding,
	teleporting,
	dying
}

#region variables
//keys
orb=false
dash=false
slide=false

//default vars
hspd=0
hspd_frac=0
vspd=0
vspd_frac=0
lastMove=0
state=playerStates.moving
lastState=state
lastInOrbwall=false
image_speed=0

//movement stuff
jumpFrames=0
airFrictionCancelFrames=0
global.gravityDir=1
cyoteFrames=0
wallrideDir=1
walljumpBufferFrames=0
canOrb=true
thrown_orb=false
#endregion