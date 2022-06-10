/// @description Create the Arrow Item.

// Inherit the parent event
event_inherited();

/* Set the Item type */
item_type = "Arrow";

/* Find the Player Entity */
var _inst;
	_inst = instance_find(objEntityPlayer, 0);
if (instance_exists(_inst)) {
	/* Check if the Player Entity has the Bow */
	if (_inst.hasBow == false) {
		/* Delete the Item since we have no way of using it (we need the bow) */
		instance_destroy();
	}
}
