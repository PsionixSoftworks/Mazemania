/// @description Update the Wall Solid.
/* Check if the Wall is breakable */
if (breakable) {
	/* Check if it's damaged */
	if (damaged) {
		image_speed = 0.85;
	}
}

/* Check if the Wall is movable */
if (movable) {
	/*  */
	
	/* Get the instance that's colliding with the top of the Wall  */
	var _inst;
		_inst = instance_place(x, y - 1, objEntity);
		
	/* Make sure there's an Entity colliding with it */
	if (instance_exists(_inst)) {	// Could also be "if (_inst != noone)"
		if (_inst.yspeed > 0) {
			
			yspeed = _inst.yspeed;
		} else {
			yspeed = 0;
		}
	}
	
	/* Get the instance that's colliding with the bottom of the Wall */
	var _inst;
		_inst = instance_place(x, y + 1, objEntity);
	
	/* Make sure there's an Entity colliding with it */
	if (instance_exists(_inst)) {	// Could also be "if (_inst != noone)"
		if (_inst.yspeed < 0) {
			yspeed = _inst.yspeed;
		} else {
			yspeed = 0;
		}
	}
	
	/* Get the instance that's colliding with the left of the Wall */
	var _inst;
		_inst = instance_place(x + 1, y, objEntity);
	
	/* Make sure there's an Entity colliding with it */
	if (instance_exists(_inst)) {	// Could also be "if (_inst != noone)"
		if (_inst.xspeed > 0) {
			xspeed = _inst.xspeed;
		} else {
			xspeed = 0;
		}
	}
	
	/* Get the instance that's colliding with the right of the Wall */
	var _inst;
		_inst = instance_place(x - 1, y, objEntity);
	
	/* Make sure there's an Entity colliding with it */
	if (instance_exists(_inst)) {	// Could also be "if (_inst != noone)"
		if (_inst.xspeed < 0) {
			xspeed = _inst.xspeed;
		} else {
			xspeed = 0;
		}
	}
}
