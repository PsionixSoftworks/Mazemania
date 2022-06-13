/// @description Control the motion and update sprites.
/* Handle horizontal collisions */
if (place_meeting(x + xspeed, y, objSolid)) {
	while (!place_meeting(x + sign(xspeed), y, objSolid)) {
		x += sign(xspeed);
	}
	xspeed = 0;
}
x += xspeed;

/* Handle vertical collisions */
if (place_meeting(x, y + yspeed, objSolid)) {
	while (!place_meeting(x, y + sign(yspeed), objSolid)) {
		y += yspeed;
	}
	yspeed = 0;
}
y += yspeed;

/* Wrap screen controller */
if (x > room_width) {
	x = 0
} else if (x < 0) {
	x = room_width - 32;
}
if (y > room_height) {
	y = 0;
} else if (y < 0) {
	y = room_height - 32;
}
