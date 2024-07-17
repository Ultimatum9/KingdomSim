/// @description Camera
#macro CameraWidth 640
#macro CameraHeight 360
#macro CameraScale 3
#macro CameraSpeed 0.4
cameraTarget = obj_camera;
//global.Camera = camera_create();
global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight);
//global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight, 0, objPlayer, 4, 4, CameraWidth, CameraHeight);

//camera_set_view_border(global.Camera, CameraWidth, CameraHeight);
//camera_set_view_target(global.Camera, objPlayer);
//camera_set_view_speed(global.Camera, 4, 4);

view_enabled = true;
view_visible[0] = true;
view_set_camera(0, global.Camera);

//Viewport
window_set_size(CameraWidth * CameraScale, CameraHeight * CameraScale);
surface_resize(application_surface, CameraWidth * CameraScale, CameraHeight * CameraScale);
var windowWidth = CameraWidth * CameraScale;
var windowHeight = CameraHeight * CameraScale;
window_set_position(display_get_width() / 2 - windowWidth / 2, display_get_height() / 2 - windowHeight / 2);