/// @description Goto next level timer.
/* Go to the next room with desired effects */
if (room != room_last) {
	room_goto_next();
} else {
	game_restart();
}
