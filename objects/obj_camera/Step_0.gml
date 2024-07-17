/// @description Manual Controls
var cameraX = camera_get_view_x(global.Camera);
var cameraY = camera_get_view_y(global.Camera);
//Zooming in and out
var cameraWidth = camera_get_view_width(global.Camera);
var cameraHeight = camera_get_view_height(global.Camera);

//Move the camera with arrow keys
var left = 0 var right = 0 var up = 0 var down = 0;
if (keyboard_check(vk_left))		left = 1 * 16;
else if (keyboard_check(vk_right))	right = 1 * 16;
else if (keyboard_check(vk_up))		up = 1 * 16;
else if (keyboard_check(vk_down))	down = 1 * 16;

x += right - left;
y += down - up;

var targetX = cameraTarget.x - cameraWidth / 2;
var targetY = cameraTarget.y - cameraHeight / 2;

//Clamp
targetX = clamp(targetX, 0, room_width - cameraWidth);
targetY = clamp(targetY, 0, room_height - cameraHeight);

//Smooth Move
cameraX = lerp(cameraX, targetX, CameraSpeed);
cameraY = lerp(cameraY, targetY, CameraSpeed);

var wheel = mouse_wheel_down() - mouse_wheel_up();

if(wheel != 0) {
	wheel *= 0.1;
	
	//How much to add
	var addWidth = cameraWidth * wheel;
	var addHeight = cameraHeight * wheel;
	
	cameraWidth += addWidth;
	cameraHeight += addHeight;
	
	//Clamping Zoom
	var prevWidth = cameraWidth;
	var prevHeight = cameraHeight;
	cameraWidth = clamp(cameraWidth, CameraWidth / 2, room_width);
	cameraHeight = clamp(cameraHeight, CameraHeight / 2, room_height);
	
	if(cameraWidth / cameraHeight == 1.777777777777778 &&
	(prevWidth == cameraWidth || prevHeight == cameraHeight)) {
		//Position
		cameraX -= addWidth / 2;
		cameraY -= addHeight / 2;
		//Clamp the movement
		cameraX = clamp(cameraX, 0, room_width - cameraWidth);
		cameraY = clamp(cameraY, 0, room_height - cameraHeight);
	}
	else {
		cameraWidth = prevWidth - addWidth;
		cameraHeight = prevHeight - addHeight;
	}
}

//Apply Changes
camera_set_view_pos(global.Camera, cameraX, cameraY);
camera_set_view_size(global.Camera, cameraWidth, cameraHeight);