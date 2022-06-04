/// @description Setup the game and go to the first level.
/* Define macros. Will go in a script called 'MACROS' later. Set to false before release. */
#macro DEVELOPMENT_MODE			true

/* First we need to chaeck if this room is in fact 'rmInit' */
if (room == rmInit) {
	/* If it is, go to Level 1 */
	room_goto(rmLevel1);
	
	/* Start up the game's music */
	audio_play_sound(sndMusic1, 1, true);	// This might not be the only track...
}
