/// @description Update the Player Entity with movement.

// Inherit the parent event
event_inherited();

/* Check if the Player is active */
if (active == true) {
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

	/* Check if we're pressing the action key */
	if (keyboard_check_pressed(ord("Z"))) {
		if (numArrows > 0) {
			if (canFireArrow == true) {
				canFireArrow = false;
				var _inst;
					_inst = instance_create_layer(x, y, layer_get_id("Instances"), objEntityArrow);
				_inst.facing = facing;
				_inst.maxSpeed = 8;
				numArrows--;
				alarm[2] = room_speed / 4;
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
		
			/* Check if there's a Lock collision */
			var _inst;
				_inst = instance_place(x, y + yspeed, objLock);
			if (instance_exists(_inst)) {
				/* Check if we have a Key to the Lock */
				if (numKeys[_inst.lock_id] > 0) {
					numKeys[_inst.lock_id]--;
					instance_destroy(_inst);
				}
			}
		} else {
			sprite_index = sprPlayerIdleDown;
		}
		break;
	case "Up":
		if (yspeed < 0) {
			sprite_index = sprPlayerWalkUp;
		
			/* Check if there's a Lock collision */
			var _inst;
				_inst = instance_place(x, y + yspeed, objLock);
			if (instance_exists(_inst)) {
				/* Check if we have a Key to the Lock */
				if (numKeys[_inst.lock_id] > 0) {
					numKeys[_inst.lock_id]--;
					instance_destroy(_inst);
				}
			}
		} else {
			sprite_index = sprPlayerIdleUp;
		}
		break;
	case "Left":
		if (xspeed < 0) {
			sprite_index = sprPlayerWalkLeft;
		
			/* Check if there's a Lock collision */
			var _inst;
				_inst = instance_place(x + xspeed, y, objLock);
			if (instance_exists(_inst)) {
				/* Check if we have a Key to the Lock */
				if (numKeys[_inst.lock_id] > 0) {
					numKeys[_inst.lock_id]--;
					instance_destroy(_inst);
				}
			}
		} else {
			sprite_index = sprPlayerIdleLeft;
		}
		break;
	case "Right":
		if (xspeed > 0) {
			sprite_index = sprPlayerWalkRight;
		
			/* Check if there's a Lock collision */
			var _inst;
				_inst = instance_place(x + xspeed, y, objLock);
			if (instance_exists(_inst)) {
				/* Check if we have a Key to the Lock */
				if (numKeys[_inst.lock_id] > 0) {
					numKeys[_inst.lock_id]--;
					instance_destroy(_inst);
				}
			}
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
			numArrows += 30;
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
		case "Diamond":
			if (room != room_last) {
				alarm[1] = room_speed;
			} else {
				game_restart();
			}
			instance_destroy(_inst);
			break;
		};
	}
	
	/* Find an enemy Entity */
	var _inst;
		_inst = instance_place(x, y, objEntityEnemy);
	
	/* Check if we're colliding with one */
	if (instance_exists(_inst)) {
		/* Check if the Player has hitpoints */
		if (hasHitPoints == true) {
			if (hurt == false) {
				hurt		= true;
				image_alpha = 0.85;
				alarm[4]	= room_speed / 4;	// A quarter of a second.
			}
		} else {
			xspeed			= 0;
			yspeed			= 0;
			facing			= "Down";
			x				= xstart;
			y				= ystart;
			active			= false;
			sprite_index	= sprPlayerIdleDown;
			lifeCount--;
			alarm[0]		= room_speed / 2;
		}
	}
	
	/* Check if we've run out of lives */
	if (lifeCount <= 0) {
		/* For now, just restart the game. This will be changed later */
		game_restart();
	}
}
