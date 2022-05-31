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
			/* Set the facing direction to <Down> */
			facing = "Down";
			
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
			/* Set the facing direction to <Up> */
			facing = "Up";
			
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
			/* Set the facing direction to <Left> */
			facing = "Left";
			
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
			/* Set the facing direction to <Right> */
			facing = "Right";
			
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

/* Check which way the Entity is facing */
switch (facing) {
case "Down":
	if (yspeed > 0) {
		sprite_index = sprPlayerWalkDown;
	} else {
		sprite_index = sprPlayerIdleDown;
	}
	break;
case "Up":
	if (yspeed < 0) {
		sprite_index = sprPlayerWalkUp;
	} else {
		sprite_index = sprPlayerIdleUp;
	}
	break;
case "Left":
	if (xspeed < 0) {
		sprite_index = sprPlayerWalkLeft;
	} else {
		sprite_index = sprPlayerIdleLeft;
	}
	break;
case "Right":
	if (xspeed > 0) {
		sprite_index = sprPlayerWalkRight;
	} else {
		sprite_index = sprPlayerIdleRight;
	}
	break;
};

/* Check to see if there is a collision with an Item */
var _inst;
	_inst = instance_place(x, y, objItem);
if (instance_exists(_inst)) {
	/* Check to see which item it is */
	var _type;
		_type = _inst.item_type;
	switch (_type) {
	case "Bow":
		hasBow = true;
		instance_destroy(_inst);
		break;
	case "Bomb":
		var _count;
			_count = _inst.item_count;
		if (numBombs < 100) {
			numBombs += _count;
		}
		instance_destroy(_inst);
		break;
	case "Arrow":
		var _count;
			_count = _inst.item_count;
		if (numArrows < 100) {
			numArrows += _count;
		}
		instance_destroy(_inst);
		break;
	case "Key":
		var _id;
			_id = _inst.key_id;
		if ((_id == 0 || _id == 1) && numKeys[_id] < 3) {
			numKeys[_id]++;
			instance_destroy(_inst);
		} else if ((_id == 2 || _id == 3) && numKeys[_id] < 2) {
			numKeys[_id]++;
			instance_destroy(_inst);
		} else if (_id == 4 && numKeys[_id] < 1) {
			numKeys[_id]++;
			instance_destroy(_inst);
		}
		break;
	case "Gem":
		var _id;
			_id = _inst.gem_id;
		if (_id == 0) {
			numGems++;
			if (hasPoints == true) {
				numPoints += 10;
			}
		} else if (_id == 1) {
			numGems += 5;
			if (hasPoints == true) {
				numPoints += 50;
			}
		} else if (_id == 2) {
			numGems += 10;
			if (hasPoints == true) {
				numPoints += 100;
			}
		} else if (_id == 3) {
			numGems += 20;
			if (hasPoints == true) {
				numPoints += 200;
			}
		} else if (_id == 4) {
			numGems += 50;
			if (hasPoints == true) {
				numPoints += 500;
			}
		}
		instance_destroy(_inst);
		break;
	};
}
