%! First cube

wall_x_values = [0 1 1 0];
wall_y_values = [0 0 1 1];
wall_z_values = [0 0 1 1];

patch(wall_x_values, wall_y_values, wall_z_values, 'blue', 'FaceAlpha', 0.5);