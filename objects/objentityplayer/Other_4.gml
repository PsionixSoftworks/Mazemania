/// @description Insert description here
// You can write your code in this editor
active			= false;
xspeed			= 0;
yspeed			= 0;
facing			= "Down";
sprite_index	= sprPlayerIdleDown;
startx			= 0;
starty			= 0;

/* Before the Player Start object is removed, get the starting coordinates */
var _inst;
	_inst = instance_find(objPlayerStart, 0);
if (instance_exists(_inst)) {
	startx = _inst.startx;
	starty = _inst.starty;
	_inst.visible = false;
}
