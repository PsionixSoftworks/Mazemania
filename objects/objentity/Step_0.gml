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
