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
image_speed=0

//move
accSpd=0.5
maxAcceleration=3
moveAnimationSpd=0.3

//jump
jumpFrames=0
maxJumpFrames=15
jumpSpd=3
airFriction=0.25
airFrictionCancelFrames=0
maxAirFrctionCancelFrames=10

//fall
#macro GRAVITY_SPD 0.3
global.gravityDir=1
cyoteFrames=0
maxCyoteFrames=5

//wallride
wallrideDir=1
wallrideGrv=0.05
wallrideJumpSpd=-3

//orb
canOrb=true
thrown_orb=false