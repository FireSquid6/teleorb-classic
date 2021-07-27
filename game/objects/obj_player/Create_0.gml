enum playerStates
{
	moving,
	jumping,
	falling,
	wallriding
}

hspd=0
vspd=0
lastMove=0
state=playerStates.moving

//move
accSpd=1
maxAcceleration=6

//jump
jumpFrames=0
maxJumpFrames=15
jumpSpd=6
airFriction=0.5
airFrictionCancelFrames=0
maxAirFrctionCancelFrames=10

//fall
#macro GRAVITY_SPD 0.4
global.gravityDir=1
cyoteFrames=0
maxCyoteFrames=5

//wallride
wallrideDir=1
wallrideGrv=0.1
wallrideJumpSpd=-6

//orb
canOrb=true
thrown_orb=false