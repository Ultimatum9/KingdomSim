function scr_Resolution() {

	var _width = global.resolution.width * global.resolution.scale;
	var _height = global.resolution.height * global.resolution.scale;

	// Resize the game to the size of the new width and height
	surface_resize(application_surface, _width, _height);

	// Set the window size of the game
	window_set_size(_width, _height);

	// Set the size of the GUI to be the same as the window
	display_set_gui_size(_width, _height);

	// Get the width and height of the monitor and centre the game based on those values
	var _displayWidth = display_get_width();
	var _displayHeight = display_get_height();

	window_set_position(
		_displayWidth / 2 - _width / 2,
		_displayHeight /2 - _height / 2
	);
}