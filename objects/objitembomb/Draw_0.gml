/// @description Insert description here
/* Draw the Bomb Item */
draw_self();

/* Only draw the item count when it's greater than 1 */
if (item_count > 1) {
	draw_text(x + 12, y + 12, string(item_count) + "x");
}
