/// @description Draw the HUD for the Player.
/* First we need to locate the player */
var _inst;
	_inst = instance_find(objEntityPlayer, 0);

/* Now if the Player doesn't exist, we want to dispatch a message and end the game */
if (!instance_exists(_inst)) {
	/* The end user should never see this message. The Level Editor will not allow you to save or 
	 * test the level if there is no Player object. 
	 */
	show_message_async("Error: No Player object found in the level.");
	game_end();
}

/* the '_yoffset' variable is responsible for positioning */
var _yoffset;
	_yoffset = 0;

/* If the above didn't happen, we can proceed with the drawing of HUD. Let's start with life count.
 * We have to iterate through the lives to draw them as an image.
 */
for (var i = 0; i < _inst.lifeCount; i++) {
	if (_inst.lifeCount > 5) {
		draw_text(0, 0, "Lives: " + string(_inst.lifeCount));
	} else {
		draw_text(0, 0, "Lives: ");
		draw_sprite_ext(sprPlayerIdleDown, 0, 56 + ( i * 24), _yoffset, 0.75, 0.75, 0, c_white, 1.0);
	}
}

/* Move the yoffset to 28 to make room for the health and stamina bar. */
_yoffset += 28;

/* Now we check for hitPoints */
if (_inst.hasHitPoints == true) {
	draw_healthbar(0, _yoffset, 124, _yoffset + 8, (_inst.hitPoints / _inst.hitPointsMax) * 100, c_black, c_red, c_red, 0, true, true);
	_yoffset += 10;
}

/* Now we check for stamina */
if (_inst.hasStamina == true) {
	draw_healthbar(0, _yoffset, 124, _yoffset + 8, (_inst.stamina / _inst.staminaMax) * 100, c_black, c_green, c_green, 0, true, true);
	_yoffset += 10;
}

/* Now we check for score */
if (_inst.hasPoints == true) {
	draw_text(0, _yoffset, "Score: " + string(_inst.numPoints));
	_yoffset += 10;
}

/* Now we check foe arrows */
if (_inst.numArrows > 0) {
	draw_text(0, _yoffset, "Arrows: " + string(_inst.numArrows));
	_yoffset += 10;
}

/* Now we draw the Gem Item with a 'times' (x) symbol and a count for Gems */
draw_text(176 + 24, 0, "Gems: " + string(_inst.numGems));
