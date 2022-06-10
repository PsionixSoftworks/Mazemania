/// @description Setup the Player and move him to here when the next room starts.
/* Declare instance variables */
startx				= x;
starty				= y;

/* Find the Player instance */
var _inst;
	_inst = instance_find(objEntityPlayer, 0);

/* If the instance does not exist */
if (!instance_exists(_inst)) {
	/* Spawn the Player at the starting coordinates */
	_inst = instance_create_layer(startx, starty, layer_get_id("Instances"), objEntityPlayer);
	_inst.facing	= "Down";
} else {
	/* Otherwise, we'll just place the Player at the starting coordinates */
	_inst.x			= startx;
	_inst.y			= starty;
	_inst.facing	= "Down";
}
