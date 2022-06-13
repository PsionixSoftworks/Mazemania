/// @description Create the Bomb Item

// Inherit the parent event
event_inherited();

/* Set the Item type */
item_type = "Bomb";

/* Find the Player Entity */
var _inst;
	_inst = instance_find(objEntityPlayer, 0);
if (instance_exists(_inst)) {
	/* Check if the Player Entity has the Bow */
	if (_inst.hasBow == true) {
		/* Destroy the Item because the Player chose the Bow */
		instance_destroy();
	}
}