/// @description Update the Player Entity with movement.

// Inherit the parent event
event_inherited();

/* Find the Grid Manager object if it exists */
var _gridManager;
	_gridManager = instance_find(objGridManager, 0);
	
/* Check if it exists */
if (!instance_exists(_gridManager)) {
	/* If not, create a new instance of it */
	_gridManager = instance_create_layer(0, 0, layer_get_id("Instances"), objGridManager);
}

/* Check if we're pressing the <Down> key */
if (keyboard_check(vk_down)) {
	/* Make sure we're not moving horizontally */
	if (xspeed == 0) {		
		/* Check if we're aligned to the grid */
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			/* Move vertically */
			yspeed = maxSpeed / 2;
		}
	}
}

/* Check if we're pressing the <Up> key */
if (keyboard_check(vk_up)) {
	/* Make sure we're not moving horizontally */
	if (xspeed == 0) {
		/* Check if we're aligned to the grid */
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			/* Move vertically */
			yspeed = -maxSpeed / 2;
		}
	}
}

/* Check if we're pressing the <Left> key */
if (keyboard_check(vk_left)) {
	/* Make sure we're not moving vertically */
	if (yspeed == 0) {
		/* Check if we're aligned to the grid */
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			/* Move horizontally */
			xspeed = -maxSpeed / 2;
		}
	}
}

/* Check if we're pressing the <Right> key */
if (keyboard_check(vk_right)) {
	/* Make sure we're not moving vertically */
	if (yspeed == 0) {
		/* Check if we're aligned to the grid */
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			/* Move horizontally */
			xspeed = maxSpeed / 2;
		}
	}
}

if (!keyboard_check(vk_down) && !keyboard_check(vk_up)) {
	/* It the <Down> key and/or the <Up> key is released, we want to make sure we're within a grid cell */
	if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
		/* Stop yspeed */
		yspeed = 0;
	}
}

if (!keyboard_check(vk_left) && !keyboard_check(vk_right)) {
	/* It the <Left> key and/or the <Right> is released, we want to make sure we're within a grid cell */
	if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
		/* Stop yspeed */
		xspeed = 0;
	}
}
