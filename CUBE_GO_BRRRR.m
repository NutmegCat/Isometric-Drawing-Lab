% Define the cube heights from the given diagram 
heights = [1 1; 1 2; 2 1];  % Shape as per the grid

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
        
        % Select color based on the height of the cube
        if h == 2
            color = 'red';   % Red for height 2
        else
            color = 'blue';  % Blue for height 1
        end
        
        % Draw the vertical walls (sides of the cube) with color
        for k = 1:4
            wall_x = [x_base(k), x_base(mod(k, 4)+1)];
            wall_y = [y_base(k), y_base(mod(k, 4)+1)];
            wall_z = [z_base(k), z_top(k)];
            patch([wall_x(1) wall_x(2) wall_x(2) wall_x(1)], ...
                  [wall_y(1) wall_y(2) wall_y(2) wall_y(1)], ...
                  [0 0 z_top(k) z_top(k)], color);
        end
        
        % Draw the top face
        patch(x_base, y_base, z_top, color);
        
        % Draw the bottom face for visibility
        patch(x_base, y_base, z_base, color);
    end
end

% Set axis labels
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Color-Coded Cubes by Height');
hold off;