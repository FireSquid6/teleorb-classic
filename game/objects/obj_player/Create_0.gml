enum playerStates
{
	moving,
	jumping,
	falling,
	wallriding,
	dashing
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
airFriction=0.2

//fall
#macro GRAVITY_SPD 0.3
cyoteFrames=0
maxCyoteFrames=5