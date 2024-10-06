% define the cube heights from the given diagram
heights = [1 1; 1 2; 2 1];  % shape as per the grid

% initialize the figure
figure;
hold on;
axis equal;
view(3);  % set view to 3D
grid on;

% set transparency level (0 = fully transparent, 1 = fully opaque)
transparency = 0.6;  % 60% opaque, 40% transparent

% function to create each cube
for i = 1:size(heights, 1)
    for j = 1:size(heights, 2)
        h = heights(i, j);  % height of the current cube

        % base coordinates of the cube
        x_base = [j-1, j, j, j-1];
        y_base = [i-1, i-1, i, i];
        z_base = [0, 0, 0, 0];

        % top coordinates of the cube
        z_top = [h, h, h, h];

        % select color based on the height of the cube
        if h == 2
            color = 'red';   % red for height 2
        else
            color = 'blue';  % blue for height 1
        end

        % draw the vertical walls (sides of the cube) with transparency
        for k = 1:4
            wall_x = [x_base(k), x_base(mod(k, 4)+1)];
            wall_y = [y_base(k), y_base(mod(k, 4)+1)];
            wall_z = [z_base(k), z_top(k)];
            patch([wall_x(1) wall_x(2) wall_x(2) wall_x(1)], ...
                [wall_y(1) wall_y(2) wall_y(2) wall_y(1)], ...
                [0 0 z_top(k) z_top(k)], color, 'FaceAlpha', transparency);
        end

        % draw the top face with transparency
        patch(x_base, y_base, z_top, color, 'FaceAlpha', transparency);

        % draw the bottom face with transparency
        patch(x_base, y_base, z_base, color, 'FaceAlpha', transparency);
    end
end

% set axis labels
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Lab D: Shape 1 - Aaron Prince Anu');
hold off;