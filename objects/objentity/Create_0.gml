/// @description Initialize all of the Entity variables all Entities will use.
/* Declare the speed variables */
xspeed			= 0;	// xspeed controls the horizontal speed.
yspeed			= 0;	// yspeed controls the vertical speed.
maxSpeed		= 4;	// The maxSpeed is the fastest an Entity can move around in the level.

/* Declare the stat variables */
hitPoints		= 3;	// hitPoints is basically the health. If this is used, it can take the form of a health bar or sprites like Zelda hearts.
lifeCount		= 3;	// lifeCount is how many lives the player has left.
stamina			= 10;	// If used, stamina will allow the Player to run when pressing the bound sprint key.
numPoints		= 0;	// If used, numPoints will represent the score.

/* Declare item variables */
hasBow			= false;
numBombs		= 0;
numArrows		= 0;
numKeys[0]		= 0;
numKeys[1]		= 0;
numKeys[2]		= 0;
numKeys[3]		= 0;
numKeys[4]		= 0;
numGems			= 0;
