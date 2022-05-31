/// @description Create the Wall Solid.
/* Declare speed variables */
xspeed = 0;
yspeed = 0;
maxSpeed = 2;

/* Declare instance variables */
breakable		= false;		// If this is set to true, bombs can destroy it.
damaged			= false;		// If this is damaged, it will shatter.
movable			= false;		// If this is set to true, Entities can move this object around.
image_index		= 0;			// Set the image index to 0, this is the first frame.
image_speed		= 0;			// When damaged, it will animate at 85% its normal speed. When not damaged, it won't animate at all.
