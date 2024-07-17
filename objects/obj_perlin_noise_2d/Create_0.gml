/// @description Perlin Noise 2D

seed = 0.1723855621;
random_set_seed(seed);

noise_map_size = 256;
tile_size = 32;
actual_map_size = noise_map_size * tile_size;
tile_set = ts_terrains_fences;
perlin_noise_map = [];

not_drawn = true;

Y_start = random(seed);
X = random(seed);
inc = 0.05;

for (var col = 0; col < noise_map_size; col += 1) {
			
	var Y = Y_start;
	for (var row = 0; row < noise_map_size; row += 1) {
				
		var _val = perlin_noise(X, Y);
		
		perlin_noise_map[col, row] = _val;
				
		Y += inc;
	}	
			
	X += inc;
}