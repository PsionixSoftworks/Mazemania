/// @description Create the Grid Manager Instance.
/* Set the width and height defaults. The default values are 32x32. The width and height should always be the same */
gridWidth	= sprite_get_width(sprPlayerIdleDown);
gridHeight	= gridWidth;

/* Toggle is used to show/hide the grid in a level. Typically only used in the Level Editor. */
toggle		= false;
