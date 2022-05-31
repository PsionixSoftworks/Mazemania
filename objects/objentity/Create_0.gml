/// @description Initialize all of the Entity variables all Entities will use.
/* Declare the speed variables */
xspeed			= 0;		// xspeed controls the horizontal speed.
yspeed			= 0;		// yspeed controls the vertical speed.
maxSpeed		= 4;		// The maxSpeed is the fastest an Entity can move around in the level.

/* Declare the stat variables */
hitPoints		= 10;		// hitPoints is basically the health. If this is used, it can take the form of a health bar or sprites like Zelda hearts.
hitPointsMax	= 10;		// The maximum amount of hit points before death.
lifeCount		= 3;		// lifeCount is how many lives the player has left.
lifeCountMax	= 99;		// The maximum number of lives the Player can have.
stamina			= 10;		// If used, stamina will allow the Player to run when pressing the bound sprint key.
staminaMax		= 10;		// The max stamina points.
numPoints		= 0;		// If used, numPoints will represent the score.
hasHitPoints	= false;	// If true, enables hit points
hasStamina		= false;	// If true, enables the samina bar.
hasPoints		= false;		// If true, enables score.

/* Declare item variables */
hasBow			= false;	// If the Entity has a bow, he can fire arrows if he has any.
numBombs		= 0;		// The number of bombs this Entity is carrying (max is 99).
numArrows		= 0;		// The number of arrows this Entity is carrying (max is 99).
numKeys[0]		= 0;		// The number of black keys the Entity is carrying (max is 3).
numKeys[1]		= 0;		// The number of copper keys the Entity is carrying (max is 3).
numKeys[2]		= 0;		// The number of silver keys the Entity is carrying (max is 2).
numKeys[3]		= 0;		// The number of golden keys the Entity is carrying (max is 2).
numKeys[4]		= 0;		// The number of purple (special) keys the Entity is carrying (max is 1).
numGems			= 0;		// The number of gems in the Entities pouch.

/* Declare other instance variables */
image_speed		= 0.85;		// The animations will play at 85% their normal speed.
facing			= "Down";	// The direction the Entity is facing.
