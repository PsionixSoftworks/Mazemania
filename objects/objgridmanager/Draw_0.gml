/// @description Draw the grid lines in the room.
/* Check if the grid is toggled on */
if (toggle == true) {
	/* Initialize i and j as local variables */
	var i, j;

	/* Iterate through the height of the room */
	for (j = 0; j < room_height; j += gridHeight) {
		/* Iterate through the width of the room */
		for (i = 0; i < room_width; i += gridWidth) {
			/* Draw the grid lines */
			draw_line(i, 0, i, room_height);
			draw_line(0, j, room_width, j);
		}
	}
}
