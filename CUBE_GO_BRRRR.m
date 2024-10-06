% Define the cube heights from the given diagram
heights = [2 1; 1 2; 1 1];  % Shape as per the grid

% Initialize the figure
figure;
hold on;
axis equal;
view(3);  % Set view to 3D
grid on;

% Function to create each cube
for i = 1:size(heights, 1)
    for j = 1:size(heights, 2)
        h = heights(i, j);  % Height of the current cube
        
        % Base coordinates of the cube
        x_base = [j-1, j, j, j-1];
        y_base = [i-1, i-1, i, i];
        z_base = [0, 0, 0, 0];
        
        % Top coordinates of the cube
        z_top = [h, h, h, h];
        
        % Draw the vertical walls (sides of the cube)
        wall_x = [x_base; x_base];
        wall_y = [y_base; y_base];
        wall_z = [z_base; z_top];
        for k = 1:4
            patch(wall_x(:, k), wall_y(:, k), wall_z(:, k), 'yellow');
        end
        
        % Draw the top face
        patch(x_base, y_base, z_top, 'cyan');
    end
end

% Set axis labels
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Simple Isometric Drawing of the Shape');
hold off;
