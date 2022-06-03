/// @description Update the game input.
/* check if the <Escape> key is pressed */
if (keyboard_check_pressed(vk_escape)) {
	/* End the game for now */
	game_end();
}

/* Check if the level skip key is pressed (development only!) */
if (DEVELOPMENT_MODE == true) {
	if (keyboard_check_pressed(ord("S"))) {
		if (room != room_last) {
			room_goto_next();
		}
	}
}

/* There can only be one Player instance at a time. Make sure there are no duplicates */
var _count;
	_count = instance_number(objEntityPlayer);
if (_count > 1) {
	/* We need to see how many extras there are */
	for (var i = _count; i > 0; i--) {
		var _inst;
			_inst = instance_find(objEntityPlayer, i);
		
		/* Show a message that the instances were removed */
		show_debug_message("[INFO]: Instance of 'objEntityPlayer' removed.");
		
		/* Remove them from the game */
		instance_destroy(_inst);
	}
}
