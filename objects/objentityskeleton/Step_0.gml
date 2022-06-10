/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/* Find the Grid Manager */
var _gridManager;
	_gridManager = instance_find(objGridManager, 0);

/* If it cannot be found, create a new one */
if (!instance_exists(_gridManager)) {
	_gridManager = instance_create_layer(0, 0, layer_get_id("Instances"), objGridManager);
}

if (movementType == "UpDown") {
	if (facing == "Down") {
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			yspeed = (maxSpeed / 4);
		}
	} else if (facing == "Up") {
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			yspeed = (-maxSpeed / 4);
		}
	}
} else if (movementType == "LeftRight") {
	if (facing == "Left") {
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			xspeed = -maxSpeed / 4;
		}
	} else if (facing == "Right") {
		if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
			xspeed = maxSpeed / 4;
		}
	}
}

if (yspeed > 0) {
	facing = "Down";
} else if (yspeed < 0) {
	facing = "Up";
} else if (xspeed < 0) {
	facing = "Left";
} else if (xspeed > 0) {
	facing = "Right";
}

if (xspeed != 0 || yspeed != 0) {
	sprite_index = sprSkeletonWalk;
} else {
	sprite_index = sprSkeletonIdle;
}

/* Check for vertical collisions.
 * This is sign(xspeed) * 2 because it would be (1 + -1) * 2  or (1 + 1) * 2. It needs to be at 
 * least one more than the xspeed otherwise the Entity doesn't reverse his motion!
 */
var _inst;
	_inst = instance_place(x, y + sign(yspeed) * 2, objSolid);
if (instance_exists(_inst)) {
	if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
		yspeed = -yspeed;
	}
}

/* Check for horizontal collisions.
 * This is sign(xspeed) * 2 because it would be (1 + -1) * 2  or (1 + 1) * 2. It needs to be at 
 * least one more than the xspeed otherwise the Entity doesn't reverse his motion!
 */
var _inst;
	_inst = instance_place(x + sign(xspeed) * 2, y, objSolid);
if (instance_exists(_inst)) {
	if (place_snapped(_gridManager.gridWidth, _gridManager.gridHeight)) {
		xspeed = -xspeed;
	}
}

/* Check if the Skeleton is colliding with an arrow */
var _inst;
	_inst = instance_place(x, y, objEntityArrow);
if (instance_exists(_inst)) {
	/* Check to see if hasHitPoints is true */
	if (hasHitPoints == true) {
		/* Check if the Skeleton has a frame of invincibility */
		if (hurt == false) {
			/* Take damage */
			hurt = true;
			hitPoints--;
			image_alpha = 0.5;
			audio_play_sound(sndEffectCrunch, 1, false);
			instance_destroy(_inst);
			alarm[4] = room_speed / 4;	// 1/4 of a second.
		}
	} else {
		/* Otherwise, kill the Skeleton instantly */
		audio_play_sound(sndEffectCrunch, 1, false);
		instance_destroy(_inst);
		instance_destroy();
	}
}

/* Find the Explosion object */
var _inst;
	_inst = instance_place(x, y, objExplosion);

/* Handle death from running out of hit points */
if (hasHitPoints == true && hitPoints <= 0 || instance_exists(_inst)) {
	audio_play_sound(sndEffectCrunch, 1, false);
	instance_destroy();
}
