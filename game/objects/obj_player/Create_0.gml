enum playerStates
{
	moving,
	jumping,
	wallriding,
	dashing,
	falling
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
maxJumpFrames=6
jumpSpd=4
airFriction=0.2

//fall
#macro GRAVITY_SPD 0.3