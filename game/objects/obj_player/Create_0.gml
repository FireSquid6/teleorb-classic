enum playerStates
{
	moving,
	jumping,
	falling,
	wallriding
}

//unlocks
orbUnlocked=false
dashUnlocked=false
slideUnlocked=false

//default vars
hspd=0
hspd_frac=0
vspd=0
vspd_frac=0
lastMove=0
state=playerStates.moving
lastState=state
image_speed=0

#region MOVEMENT VARS
//move
accSpd=0.5
maxAcceleration=3

//jump
jumpFrames=0
maxJumpFrames=15
jumpSpd=3
airFriction=0.5
airFrictionCancelFrames=0
maxAirFrctionCancelFrames=10

//fall
#macro GRAVITY_SPD 0.4
global.gravityDir=1
cyoteFrames=0
maxCyoteFrames=5
terminalVelocity=7

//wallride
wallrideDir=1
wallrideGrv=0.05
wallrideJumpSpd=-3
walljumpBufferFrames=0
maxWalljumpBufferFrames=5

//orb
canOrb=true
thrown_orb=false
#endregion