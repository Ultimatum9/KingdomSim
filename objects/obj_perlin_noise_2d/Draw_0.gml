/// @description Perlin Noise 2D
if (not_drawn) {
	for (var col = 0; col < noise_map_size; col += 1) {
		for (var row = 0; row < noise_map_size; row += 1) {
				
			var _val = perlin_noise_map[col, row];
			
			var adjusted_col = (map_value(col, 0, noise_map_size, 0, actual_map_size) / tile_size);
			var adjusted_row = (map_value(row, 0, noise_map_size, 0, actual_map_size) / tile_size);
			
			var lay_id = layer_get_id("Surfaces");
			var map_id = layer_tilemap_get_id(lay_id);
			
			if (-1 <= _val && _val < -0.5) {
				tilemap_set(map_id, 188, adjusted_col, adjusted_row);
			}
			else if (-0.5 <= _val && _val < 0) {
				tilemap_set(map_id, 349, adjusted_col, adjusted_row);
			}
			else if (0 <= _val && _val < 0.5) {
				tilemap_set(map_id, 225, adjusted_col, adjusted_row);
			}
			else if (0.5 <= _val && _val <= 1) {
				tilemap_set(map_id, 72 , adjusted_col, adjusted_row);
			}
		}
	}
	not_drawn = false;
}
