/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/* Change the sprite based on Entity facing direction */
if (facing == "Down") {
	sprite_index = sprArrowDown;
	yspeed = maxSpeed;
} else if (facing == "Up") {
	sprite_index = sprArrowUp;
	yspeed = -maxSpeed;
} else if (facing == "Left") {
	sprite_index = sprArrowLeft;
	xspeed = -maxSpeed;
} else if (facing == "Right") {
	sprite_index = sprArrowRight;
	xspeed = maxSpeed;
}

if (facing == "Down") {
	var _inst;
		_inst = instance_place(x, y + maxSpeed, objSolid);
	if (instance_exists(_inst)) {
		if (collision_flag == false) {
			collision_flag =  true;
			alarm[0] = room_speed;
		}
	}
} else if (facing == "Up") {
	var _inst;
		_inst = instance_place(x, y - maxSpeed, objSolid);
	if (instance_exists(_inst)) {
		if (collision_flag == false) {
			collision_flag =  true;
			alarm[0] = room_speed;
		}
	}
} else if (facing == "Left") {
	var _inst;
		_inst = instance_place(x - maxSpeed, y, objSolid);
	if (instance_exists(_inst)) {
		if (collision_flag == false) {
			collision_flag =  true;
			alarm[0] = room_speed;
		}
	}
} else if (facing == "Right") {
	var _inst;
		_inst = instance_place(x + maxSpeed, y, objSolid);
	if (instance_exists(_inst)) {
		if (collision_flag == false) {
			collision_flag =  true;
			alarm[0] = room_speed;
		}
	}
}
